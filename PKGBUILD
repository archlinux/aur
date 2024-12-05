# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-wtforms-test
_pkgname=WTForms-Test
pkgver=0.1.1
pkgrel=2
pkgdesc='Unit test helpers for WTForms based forms'
arch=('any')
url="https://wtforms-test.readthedocs.io"
license=('BSD-3-Clause')
makedepends=(python-setuptools)
depends=('python-wtforms')

source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('869ba4c1c334ff3bcf1e3260e8d547b77e8052f4c92f185d3b1e242ab376ef6f')

build() {
    cd "${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
