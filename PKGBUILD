# Maintainer: dragon <dragons@fn.de>

pkgname=python-countryguess
_pkgname=${pkgname#python-}
pkgver=0.4.9
pkgrel=1
pkgdesc='Fuzzy lookup of country information'
arch=('any')
url="https://codeberg.org/plotski/countryguess"
license=('GPL-3.0-only')
depends=(python)
makedepends=(git python-{build,installer,wheel,setuptools})
source=("git+$url#tag=v$pkgver")
sha512sums=('21fd37e955e9f4d0ede559c6ea897e186a1478aaa6cbdd5574842f520653c9d4e7dca49f4ad24789923cc5382a0ce568d57e952154f3b759f3307a707618614b')


build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
