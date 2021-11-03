# Maintainer: acxz <akashpatel2008@yahoo.com>

pkgname="python-flake8-quotes"
_pkgname="flake8-quotes"
pkgver=3.3.0
pkgrel=1
pkgdesc="Flake8 lint for quotes"
arch=('any')
url="https://github.com/zheller/${_pkgname}"
license=('MIT')
depends=('flake8')
source=("https://github.com/zheller/flake8-quotes/archive/$pkgver.tar.gz")
sha256sums=('c70a70a9a123ae5c700420b88430733b0a343af7d32d65b44a8cd652b5e9fbbe')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
