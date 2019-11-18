# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-bidict
_name=${pkgname#python-}
pkgver=0.18.3
pkgrel=1
pkgdesc='Bidirectional map implementation and related functionality to work with one-to-one mappings in Python 3'
arch=('any')
url='https://bidict.readthedocs.org/'
license=('MPLv2')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1742a25a9ef1b1ac4000683406879a3e1a6577faa02f31e482e6c84e2e3bf628')

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
