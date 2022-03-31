# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

_pkgname=plac
pkgname=python-${_pkgname}
pkgver=1.3.5
pkgrel=1
pkgdesc='The smartest command line arguments parser in the world'
arch=(any)
url='https://pypi.org/project/plac/'
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('8c770ea43d94a5fa80fa22f0e1fb6433e7901769315e0ecd9d6889d773e454b428265c3cd43792867dd56757cc6e31dcbda76052b46266878f07e493cf899c14')

build() {
	cd "plac-${pkgver}"
	python setup.py build
}

package() {
	cd "plac-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}
