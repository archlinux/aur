# Maintainer: Malte Bublitz <malte70+aur@mcbx.de>

pkgname=python-osdetect
pkgname_upstream=OSDetect
pkgver=1.1.1
pkgrel=1
pkgdesc="A Python module to detect the operating system."
arch=(any)
url="http://malte70.github.com/OSDetect"
license=("BSD")
depends=("python")
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname_upstream/archive/v$pkgver.tar.gz")
sha256sums=('fc3a3fc358b033d278123f11bad2f5ef3deb6e6943ee3ec312e646bad780cea6')

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
