# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-crochet
_pkgname=${pkgname/python-/}
pkgver=1.12.0
pkgrel=1
pkgdesc='Crochet is a library that makes it easier to use Twisted from regular blocking code'
url="https://github.com/itamarst/crochet"
depends=('python' 'python-twisted')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8fcbc64768813f50ee76b17a1e8d32a9f39206f8ab6766d50c885e07e7fb6fb1')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

