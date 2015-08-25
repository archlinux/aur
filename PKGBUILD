# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=storj-dataserv-client
_pkgname=${pkgname/storj-/}
pkgver=1.3.0
pkgrel=1
pkgdesc="Storj Client for storing and auditing data"
url="https://github.com/Storj/dataserv-client"
depends=('python' 'python-pip' 'python-future' 'python-randomio' 'python-partialhash')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f2f4761f9e372fd4b85136238910185bd0ff44021905debbbdab083c6968e353')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3.4/site-packages/tests/
}

