# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-icon-theme
pkgver=3.12.0
pkgrel=6
pkgdesc="GNOME icon theme"
arch=(any)
depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'gnome-icon-theme-symbolic')
makedepends=('intltool' 'icon-naming-utils')
url="http://www.gnome.org"
license=('GPL')
options=('!emptydirs')
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('359e720b9202d3aba8d477752c4cd11eced368182281d51ffd64c8572b4e503a')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    rm -f  "${pkgdir}/usr/share/icons/gnome/icon-theme.cache"
}
