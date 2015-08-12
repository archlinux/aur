# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=storj-dataserv-client
_pkgname=${pkgname/storj-//}
pkgver=1.1.0
pkgrel=1
pkgdesc="Storj Client for storing and auditing data"
url="https://github.com/Storj/dataserv-client"
depends=('python' 'python-pip')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v1.1.0.tar.gz")
sha256sums=('d454a110484857dd2ba4103b3b09a5fab8cf38bbe1e16d95f63032b2c9f80cbe')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

