# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="python-reorder-python-imports"
_pkgname="reorder_python_imports"
pkgver=2.6.0
pkgrel=1
pkgdesc="Automatically reorder python imports."
arch=('any')
url="https://github.com/asottile/${_pkgname}"
license=('MIT')
depends=('python-aspy-refactor-imports')
source=("https://github.com/asottile/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('a9f7ed384bcd5ee0c8077a5dde03149e')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
