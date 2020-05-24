# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-storjnode
_pkgname=${pkgname/python-/}
pkgver=0.1.1
pkgrel=1
pkgdesc="Low level storj protocol reference implementation"
url="https://github.com/Storj/storjnode"
depends=('python' 'python-pip' 'python-crypto' 'python-btctxstore' 'python-umsgpack' 'python-kademlia')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('27e9aa0c8b04d6cd07cfd44f5bc34c7b8e62552702769fe4910bb31303c01971')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

