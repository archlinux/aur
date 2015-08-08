# Maintainer: Malte Bublitz <malte70+aur@mcbx.de>

pkgname=python-cliapp
pkgname_upstream=pyCLIApp
pkgver=0.1
pkgrel=1
pkgdesc="A Python module for command line applications"
arch=(any)
url="https://github.com/malte70/pyCLIApp"
license=("BSD")
depends=("python")
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname_upstream/archive/$pkgver.tar.gz")
sha256sums=('5765376696961a4257c6d5c0f5cd01154b3cb115ecb155c4b9edf8853c9755b7')

package() {
	cd "${srcdir}/$pkgname_upstream-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname
	cp COPYING.md ${pkgdir}/usr/share/doc/$pkgname
	cp README.md ${pkgdir}/usr/share/doc/$pkgname
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	cd ${pkgdir}/usr/share/licenses/$pkgname
	ln -s ../../doc/$pkgname/COPING.md COPYING
}
