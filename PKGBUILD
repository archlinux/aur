# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-randomio
_pkgname=${pkgname/python-/}
_pkgdirname=RandomIO
pkgver=0.2.1
pkgrel=3
pkgdesc="Generates random bytes and files from a seed"
url="https://github.com/Storj/RandomIO"
depends=('python' 'python-pip' 'python-crypto' 'python-redis')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('db46a523bb3cd257667b4f158c00f76d21417d780ba9506a27ecdcc5c9523ee8')

build() {
    cd "$srcdir/$_pkgdirname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgdirname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

