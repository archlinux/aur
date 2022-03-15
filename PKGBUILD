# Maintainer: Letu Ren <fantasquex at gmail dot com>

pkgname=python-mulpyplexer
pkgver=0.09
pkgrel=1
pkgdesc="A module that multiplexes interactions with lists of python objects."
arch=('any')
url="https://github.com/zardus/mulpyplexer"
license=('BSD')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('144e9e9bf66d3988f60542c9d3d4c94857438f7908f60e53f4c1cb1622fbbd30')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

