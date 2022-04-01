# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-icon-theme-symbolic
pkgver=3.12.0
pkgrel=6
pkgdesc="GNOME icon theme, symbolic icons"
arch=(any)
depends=(gtk-update-icon-cache hicolor-icon-theme librsvg)
makedepends=(intltool icon-naming-utils)
url="http://www.gnome.org"
license=(GPL)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('851a4c9d8e8cb0000c9e5e78259ab8b8e67c5334e4250ebcc8dfdaa33520068b')

build() {
  cd "$pkgname-$pkgver"
  GTK_UPDATE_ICON_CACHE=/bin/true ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
