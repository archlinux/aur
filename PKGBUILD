# Maintainer: Jeena <hello@jeena.net>

pkgname=feedthemonkey
_name=FeedTheMonkey
pkgver=2.2.8
pkgrel=1
pkgdesc="Desktop client for the TinyTinyRSS reader"
arch=('i686' 'x86_64')
url="https://github.com/jeena/FeedTheMonkey"
license=('GPL3')
depends=('qt5-declarative' 'qt5-quickcontrols' 'qt5-webengine')
source=("https://github.com/jeena/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('9d3683463ba08b6bb15bdfe6ccef3681')

build() {
	cd "${_name}-$pkgver"
	qmake-qt5 PREFIX=${pkgdir}/usr
	make
}

package() {
	cd "${_name}-$pkgver"
	make install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
