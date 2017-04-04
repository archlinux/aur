# Maintainer: Malte Bublitz <malte70+aur@mcbx.de>

pkgname=python2-osdetect
pkgname_upstream=OSDetect
pkgver=1.2
pkgrel=2
pkgdesc="A Python 2 module to detect the operating system."
arch=(any)
url="http://malte70.github.com/OSDetect"
license=("BSD")
depends=("python2")
makedepends=("python2-distribute")
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname_upstream/archive/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/malte70/OSDetect/088231439ae877151a43bb7edddf1f5f7d9d994c/README.md")
sha256sums=('b2aed4191e74ed0deea2a39603744caac744124c9d15c6255ec1eac32074bd15'
            '9f4f36d47e9147c09c6e2cb53bd41d0149e37dc44da9fceeb16f9d6153fdcff4')

package() {
	cd "${srcdir}/$pkgname_upstream-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	
	mkdir -p ${pkgdir}/usr/share/doc/$pkgname
	cp AUTHOR.md ${pkgdir}/usr/share/doc/$pkgname
	cp COPYING.md ${pkgdir}/usr/share/doc/$pkgname
	cp "${srcdir}/README.md" ${pkgdir}/usr/share/doc/$pkgname
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	cd ${pkgdir}/usr/share/licenses/$pkgname
	ln -s ../../doc/$pkgname/COPING.md COPYING
}
