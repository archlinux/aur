# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-skyfield'
_name=${pkgname#python-}
pkgver='1.14'
pkgrel=1
pkgdesc="Elegant astronomy for Python"
url="https://rhodesmill.org/skyfield/"
depends=('python' 'python-numpy' 'python-jplephem')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('f192108ff305505a7c087d8a997865c0')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

