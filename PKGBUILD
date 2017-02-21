# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="flake8-import-order"
pkgver=0.11
pkgrel=1
pkgdesc="Plugin that checks import order against various Python Style Guides."
arch=('any')
url="https://github.com/PyCQA/${pkgname}"
license=('Expat')
depends=('flake8')
source=("https://github.com/PyCQA/flake8-import-order/archive/$pkgver.tar.gz")
md5sums=('706be852b44b9df3a1dfb4f38b9430da')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
