# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-partialhash
_pkgname=${pkgname/python-/}
pkgver=1.1.2
pkgrel=1
pkgdesc="Library to partialy hash files"
url="https://github.com/F483/partialhash"
depends=('python' 'python-pip')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/F483/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('29672997af56de1df69304bbddc217b252d7b7f96599a0617aa5db745da928d3')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3.4/site-packages/tests/
}

