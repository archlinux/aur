# Maintainer: Malte Bublitz <malte70+aur@mcbx.de>

pkgname=python2-osdetect
pkgname_upstream=OSDetect
pkgver=1.1.0
pkgrel=2
pkgdesc="A Python 2 module to detect the operating system."
arch=(any)
url="http://malte70.github.com/OSDetect"
license=("BSD")
depends=("python2")
makedepends=("python2-distribute")
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname_upstream/archive/$pkgver.tar.gz")
sha1sums=('7f26b9370af116c3885a2ed8676483a9c37e0887')

package() {
	cd "${srcdir}/$pkgname_upstream-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname
	cp AUTHOR.md ${pkgdir}/usr/share/doc/$pkgname
	cp COPYING.md ${pkgdir}/usr/share/doc/$pkgname
	cp README.md ${pkgdir}/usr/share/doc/$pkgname
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	cd ${pkgdir}/usr/share/licenses/$pkgname
	ln -s ../../doc/$pkgname/COPING.md COPYING
}
