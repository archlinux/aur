# Maintainer: Malte Bublitz <malte70+aur@mcbx.de>

pkgname=python-osdetect
pkgname_upstream=OSDetect
pkgver=1.1.0
pkgrel=2
pkgdesc="A Python module to detect the operating system."
arch=(any)
url="http://malte70.github.com/OSDetect"
license=("BSD")
depends=("python")
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname_upstream/archive/$pkgver.tar.gz")
sha256sums=('6a309bd13879442469d9d461f13b7824c259336879a51d0988136aac37ddf7d2')

package() {
	cd "${srcdir}/$pkgname_upstream-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname
	cp AUTHOR.md ${pkgdir}/usr/share/doc/$pkgname
	cp COPYING.md ${pkgdir}/usr/share/doc/$pkgname
	cp README.md ${pkgdir}/usr/share/doc/$pkgname
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	cd ${pkgdir}/usr/share/licenses/$pkgname
	ln -s ../../doc/$pkgname/COPING.md COPYING
}
