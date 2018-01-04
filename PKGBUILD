# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-icon-theme-extras
pkgver=3.12.0
pkgrel=3
pkgdesc="GNOME icon theme, extra icons"
arch=(any)
depends=('gnome-icon-theme')
makedepends=('intltool' 'icon-naming-utils')
url="http://www.gnome.org"
license=('GPL')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('4eec6cea8a7b09c4ed6ebab1a3b42539b9c61a53bec4b8872e774611cc619608')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
