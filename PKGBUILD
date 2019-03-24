# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-bidict
pkgver=0.18.0
pkgrel=1
pkgdesc='Bidirectional map implementation and related functionality to work with one-to-one mappings in Python 3'
arch=('any')
url='https://bidict.readthedocs.org/'
license=('MPLv2')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/8a/18/a3feb46d99a7a73c3078faf1c9b24655eace83bcf696cfecae46288cad8a/bidict-${pkgver}.tar.gz")
sha256sums=('4d10630fd5d86b7c165387473c5180e7fca7635f12e24b1f426aac259c72c81a')

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
