# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-crochet
_pkgname=${pkgname/python-/}
pkgver=1.9.0
pkgrel=1
pkgdesc="Crochet is a library that makes it easier to use Twisted from regular blocking code"
url="https://github.com/Storj/storjcore"
depends=('python' 'python-twisted')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('58c05f141b989c7425d374bb8c8c32b6bc5b6bf2ac69d8b40c28dd40a85a6286')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

