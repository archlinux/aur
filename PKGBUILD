# Maintainer: Yangtse Su <yangtsesu@gmail.com>

_pkgname=ndeftool
pkgname=${_pkgname}
pkgver=0.1.2
pkgrel=1
pkgdesc="A command line utility to create, modify and print NDEF Records."
arch=('x86_64')
url="https://github.com/nfcpy/ndeftool"
license=('ISC')
depends=(
    'python-ndeflib'
    'python-click'
    'python-magic'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nfcpy/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('942e563f6e9cb217de3bf593dca0749e374dbd908bac7699f3abeb4833ce6197')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
