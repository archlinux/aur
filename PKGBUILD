# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=zeal
epoch=1
pkgver=0.3.1
pkgrel=1
pkgdesc='An offline API documentation browser'
arch=('i686' 'x86_64')
url='https://zealdocs.org/'
license=('GPL3')
depends=('qt5-webkit' 'hicolor-icon-theme' 'desktop-file-utils' 'libarchive'
         'qt5-x11extras')
makedepends=()
conflicts=(zeal-git)
source=("zeal-${pkgver}.tar.gz::https://github.com/zealdocs/zeal/archive/v${pkgver}.tar.gz")
sha512sums=('9d95d9d3a1966c823f4eebe2a389f046df84d27262863dead558e309ac4c0ac8ee5ab1fd8f3559e9745e0ee9248df36aa66de8ca242a5d4662c6bb1d5b722280')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	QT_SELECT=5 qmake CONFIG+=force_debug_info
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}
