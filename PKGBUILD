# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgbase=('python-skyfield')
pkgname=('python-skyfield')
_name=${pkgname#python-}
pkgver='1.10'
pkgrel=1
pkgdesc="Elegant astronomy for Python"
url="https://rhodesmill.org/skyfield/"
depends=('python' 'python-numpy' 'python-jplephem')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('aac78267529b0c6ad9d1eece4ff571ea')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

