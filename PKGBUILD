# Maintainer: Katie Wolfe <wolfe@katie.host>
pkgname=akaitools
pkgver=1.4
pkgrel=1
pkgdesc='Tools for Akai S-series samplers'
arch=('any')
url='http://www.lsnl.jp/~ohsaki/software/akaitools/'
license=('GPL2')
groups=()
depends=('perl')
makedepends=('make')
optdepends=('sox: support for more file formats')
provides=('akaitools')
source=("http://www.lsnl.jp/~ohsaki/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('89c625168476ffebfb13f7219769ce6c27a75044a53508cc7e3f8e8c3f6802adea254e46266e590d56d6688cd5bc5e34873ac5e3ae747927d46002866256baa1')

build() {
	cd "${pkgname}-${pkgver}"
	perl Makefile.PL
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
