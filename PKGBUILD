# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="python-flake8-comprehensions"
_pkgname="flake8-comprehensions"
pkgver=3.10.0
pkgrel=2
pkgdesc="Flake8 plugin to help you write better list/set/dict comprehensions."
arch=('any')
url="https://github.com/adamchainz/${_pkgname}"
license=('ISC')
depends=('flake8')
makedepends=('python-setuptools')
source=("https://github.com/adamchainz/flake8-comprehensions/archive/$pkgver.tar.gz")
md5sums=('47d33393dc3c2164aa19fb080bb18322')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
