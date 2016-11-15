# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=pep8-naming
pkgname="flake-${_pkgname}"
pkgver=0.4.1
pkgrel=1
pkgdesc="Naming Convention checker for Python/Flake"
arch=('any')
url="https://github.com/PyCQA/${_pkgname}"
license=('Expat')
depends=('flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyCQA/pep8-naming/archive/$pkgver.tar.gz")
md5sums=('392bdb012310a621242c17365b9947c5')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
