# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sgp4'
_name=${pkgname#python-}
pkgver='2.15'
pkgrel=1
pkgdesc="Track earth satellite TLE orbits using up-to-date 2010 version of SGP4"
url="https://pypi.org/project/sgp4/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('d695e9fe3b8039547155faea14a796ad')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	# waiting for: https://github.com/brandon-rhodes/python-sgp4/issues/74
	#install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


