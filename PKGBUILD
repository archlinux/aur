# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-rpcudp
_pkgname=${pkgname/python-/}
pkgver=2.0
pkgrel=1
pkgdesc="RPC via UDP"
url="http://github.com/bmuller/rpcudp"
depends=('python' 'python-future' 'python-twisted' 'python-umsgpack')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9f83889d83639ab664cfac191af11c4ede8e5d7a762ff1d1b5861b06f5a7e4a7')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

