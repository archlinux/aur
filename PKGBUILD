# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=storj-dataserv-client
_pkgname=${pkgname/storj-/}
pkgver=2.1.4
pkgrel=1
pkgdesc="Storj Client for storing and auditing data"
url="https://github.com/Storj/dataserv-client"
depends=('python' 'python-pip' 'python-future' 'python-randomio' 'python-partialhash' 'python-btctxstore' 'python-psutil')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d28dba786e3c18c2bcf3448b79f316ba51103029d9bf3927a342bb777f561691')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python3.4/site-packages/tests/
}

