# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-btctxstore
_pkgname=${pkgname/python-/}
pkgver=4.5.0
pkgrel=1
pkgdesc="A library to read/write data to bitcoin transactions as nulldata outputs"
url="https://github.com/Storj/btctxtore"
depends=('python' 'python-pip' 'python-pycoin' 'python-six' 'python-ecdsa')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bead6a4c8b3e6fb207576b072c72c73e14d7d7cb3b6fc2c23b44489b88654da5')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

