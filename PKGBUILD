# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-pyp2p
_pkgname=${pkgname/python-/}
pkgver=0.6.9
pkgrel=2
pkgdesc="PyP2P is a simplified networking library for building peer-to-peer networks in Python"
url="https://github.com/Storj/pyp2p"
depends=('python' 'python-twisted' 'python-netifaces' 'python-ntplib' 'python-pyroute2')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.zip")
sha256sums=('a53e2108b3c48ac7db880bd13e1df93e2221df667780c5ff4ea8b1e0f6231445')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

