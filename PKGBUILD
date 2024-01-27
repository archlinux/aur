# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-lzf
_name=${pkgname}
pkgver=0.2.4
pkgrel=3
pkgdesc="C Extension for liblzf"
arch=('x86_64')
url="https://github.com/teepark/python-lzf"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d1420f1544e612ef1bb41ce0f1d14c2964b3444612f1468f85a886caff3615d1')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
