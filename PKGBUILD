# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D
pkgname=wdpass
pkgver=0.0.3
pkgrel=2
pkgdesc='WD Passport Ultra Complete Utilities for Linux'
arch=('any')
url='https://github.com/7aman/wdpass'
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'lsscsi' 'python-py3_sg')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3782c261c84e6134139de66602fab954cde38edebf4cf1140a7e98a7ad2915c9')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
}
