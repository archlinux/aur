# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-bidict
pkgver=0.13.1
pkgrel=1
pkgdesc='Bidirectional map implementation and related functionality to work with one-to-one mappings in Python 3'
arch=('any')
url='https://bidict.readthedocs.org/'
license=('MPLv2')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/jab/bidict/archive/v${pkgver}.tar.gz")
sha256sums=('8e5f8db24d6983920f2b3e19cad2fc52f4c0e83977bad2a67eedb2683ed2abbf')

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
