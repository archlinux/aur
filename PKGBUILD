# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-murmurhash
_origpkgname=murmurhash
pkgver=1.0.6
pkgrel=1
pkgdesc="Cython bindings for MurmurHash2"
arch=("x86_64")
url="https://github.com/explosion/murmurhash"
license=("MIT")
depends=("python" "cython" "python-pytest")
makedepends=("python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/murmurhash/archive/v$pkgver.tar.gz")
md5sums=('e058fc66933ac3e4f973187291cc4809')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
