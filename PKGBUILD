# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-bidict
pkgver=0.17.2
pkgrel=1
pkgdesc='Bidirectional map implementation and related functionality to work with one-to-one mappings in Python 3'
arch=('any')
url='https://bidict.readthedocs.org/'
license=('MPLv2')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/79/a8/83a52f422b1c041758fcfa3ac4438fc92a14e3cbe2b36f97282d973aff55/bidict-${pkgver}.tar.gz")
sha256sums=('a6477740bb73b925c1814d0f0d6deca1b74aa19f2d31f252d71f14acc53b187d')

build() {
	cd "bidict-${pkgver}"
	python3 setup.py build
}

check() {
	cd "bidict-${pkgver}"
	python3 setup.py test
}

package() {
	cd "bidict-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
