# Maintainer: Yangtse Su <yangtsesu@gmail.com>

_pkgname=ndeftool
pkgname=${_pkgname}
pkgver=0.1.1
pkgrel=1
pkgdesc="command line utility to create, modify and print NDEF Records"
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
sha256sums=('6f7c68d858e54a181639f10346a589166a09edb6a513cd8e55ada9cead64aac0')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
