# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="python-flake8-import-order"
_pkgname="flake8-import-order"
pkgver=0.18
pkgrel=1
pkgdesc="Plugin that checks import order against various Python Style Guides."
arch=('any')
url="https://github.com/PyCQA/${_pkgname}"
license=('Expat')
depends=('flake8' 'python-asttokens')
provides=('flake8-import-order')
replaces=('flake8-import-order')
source=("https://github.com/PyCQA/flake8-import-order/archive/$pkgver.tar.gz")
md5sums=('17d0b2299db05bb8be102c3eadc38dc8')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
