# Maintainer: Labello < seb.semper at gmail >

pkgname=('python-fastmat')
pkgver=0.1.1
pkgrel=1
pkgdesc="fastmat is a python package for fast lineare transforms"
arch=('x86_64')
url="https://github.com/EMS-TU-Ilmenau/fastmat"
license=('Apache')
makedepends=('cython' 'gcc' 'python-numpy' 'python-scipy' 'python-setuptools')
depends=('python-numpy' 'python-scipy')
source=(
	"https://github.com/EMS-TU-Ilmenau/fastmat/archive/${pkgver}.zip"
)
sha256sums=(
	cf5d5a4cb869a79ed5ce748cd0e267caa7a0d6690cd836cc35b437924f339f7f
)
build() {
	cd fastmat-${pkgver}
	make compile
}
package() {
	cd fastmat-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1
}
