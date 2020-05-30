# Maintainer: acxz <akashpatel2008@yahoo.com>

pkgname="python-flake8-quotes"
_pkgname="flake8-quotes"
pkgver=3.2.0
pkgrel=1
pkgdesc="Flake8 lint for quotes"
arch=('any')
url="https://github.com/zheller/${_pkgname}"
license=('MIT')
depends=('flake8')
source=("https://github.com/zheller/flake8-quotes/archive/$pkgver.tar.gz")
md5sums=('eeb206b4e444833ea1f3b45afb52c3a3')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
