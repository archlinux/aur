# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=python-plac
pkgver=1.3.0
pkgrel=1
pkgdesc="The smartest command line arguments parser in the world"
url="https://pypi.org/project/plac/"
depends=(python)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/7c/c0/404e96279ab563a98ca9fe9b7e1dfdd06e3f5ef26af965d62f706385c3bf/plac-1.3.0.tar.gz")
sha256sums=('2e6422d966ca2cbe30353ad13f1c44fddfa71f8445fb54fff0169d3c982101be')


build() {
	cd "plac-${pkgver}"
	python setup.py build
}

package() {
	cd "plac-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}
