# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>
pkgname=faba-icon-theme
pkgver=4.3
pkgrel=2
pkgdesc="A set of icons to serve as base for other themes"
arch=('any')
url='https://snwh.org/moka'
license=('LGPL3' 'CCPL')
depends=('gtk-update-icon-cache')
makedepends=('meson')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moka-project/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('34633c7d146b93abebc96d3dddd52053')

build() {
    meson --prefix /usr --buildtype plain "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
