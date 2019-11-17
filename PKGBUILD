# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sgp4'
_name=${pkgname#python-}
pkgver='1.4'
pkgrel=2
pkgdesc="Track earth satellite TLE orbits using up-to-date 2010 version of SGP4"
url="https://pypi.org/project/sgp4/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('c4141d99e56b8a8bd2657e651481d08a')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


