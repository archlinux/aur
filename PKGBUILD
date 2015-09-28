# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-storjcore
_pkgname=${pkgname/python-/}
pkgver=0.0.3
pkgrel=1
pkgdesc="Storj core library"
url="https://github.com/Storj/storjcore"
depends=('python' 'python-pip' 'python-crypto' 'python-btctxstore')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('068d8342aefb94bb30a764c93b30658390369382d87623a3191a4fb57f4c956e')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3.4/site-packages/tests/
}

