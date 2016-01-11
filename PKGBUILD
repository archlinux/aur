# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-storjnode
_pkgname=${pkgname/python-/}
pkgver=0.0.21
pkgrel=3
pkgdesc="Low level storj protocol reference implementation"
url="https://github.com/Storj/storjnode"
depends=('python' 'python-pip' 'python-crypto' 'python-btctxstore' 'python-umsgpack' 'python-kademlia')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f646d3b4e7ea505d29534d5758ab4c01159a3e9bb97135462b7c2808b240f817')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

