# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-crochet
_pkgname=${pkgname/python-/}
pkgver=1.10.0
pkgrel=1
pkgdesc='Crochet is a library that makes it easier to use Twisted from regular blocking code'
url="https://github.com/itamarst/crochet"
depends=('python' 'python-twisted')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('de0d1c9acfe8200b7ec8cf53ce5878fd20531d55c01199a9ae27936c45ef3c79')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

