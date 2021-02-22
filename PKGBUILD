# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

_pkgname=plac
pkgname=python-${_pkgname}
pkgver=1.3.2
pkgrel=1
pkgdesc="The smartest command line arguments parser in the world"
url="https://pypi.org/project/plac/"
depends=(python)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d598bc4b549282ec3a1fde40ddc4a273e051237b5aa70c44f572306a13c651e8')


build() {
	cd "plac-${pkgver}"
	python setup.py build
}

package() {
	cd "plac-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}
