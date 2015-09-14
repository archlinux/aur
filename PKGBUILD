# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-btctxstore
_pkgname=${pkgname/python-/}
pkgver=4.6.1
pkgrel=1
pkgdesc="A library to read/write data to bitcoin transactions as nulldata outputs"
url="https://github.com/Storj/btctxtore"
depends=('python' 'python-pip' 'python-pycoin' 'python-six' 'python-ecdsa')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/b/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('a361bad9caeea0b920574e6bf8f7fbcfa98717f566c294ffda42f351ca7e84eb1405de3216499ad52f5a54d734f37fe9e0b2631ac2c9648bfa3b8b85820f9e52')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}
