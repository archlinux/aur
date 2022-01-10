# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="python-flake8-comprehensions"
_pkgname="flake8-comprehensions"
pkgver=3.8.0
pkgrel=1
pkgdesc="Flake8 plugin to help you write better list/set/dict comprehensions."
arch=('any')
url="https://github.com/adamchainz/${_pkgname}"
license=('ISC')
depends=('flake8')
source=("https://github.com/adamchainz/flake8-comprehensions/archive/$pkgver.tar.gz")
md5sums=('795ac94157b2e68e857f7c2d2f7b461f')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
