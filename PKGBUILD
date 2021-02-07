# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-skyfield'
_name=${pkgname#python-}
pkgver='1.36'
pkgrel=1
pkgdesc="Elegant astronomy for Python"
url="https://rhodesmill.org/skyfield/"
depends=('python' 'python-certifi' 'python-numpy' 'python-jplephem' 'python-sgp4')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('06727f67db494a8cea4cd58bf2b10b5b1c0a576b3bd395249d6363a28e18a1b6')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

