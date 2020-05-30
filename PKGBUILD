# Maintainer: acxz <akashpatel2008@yahoo.com>

pkgname="python-flake8-deprecated"
_pkgname="flake8-deprecated"
pkgver=1.3
pkgrel=1
pkgdesc="Warns about deprecated method calls."
arch=('any')
url="https://github.com/gforcada/${_pkgname}"
license=('GPL-2.0')
depends=('flake8')
source=("https://github.com/gforcada/flake8-deprecated/archive/$pkgver.tar.gz")
md5sums=('51bb7161af44baf4ef5f1c610e0343b5')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
