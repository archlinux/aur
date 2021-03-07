# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-murmurhash
_origpkgname=murmurhash
pkgver=1.0.5
pkgrel=1
pkgdesc="Cython bindings for MurmurHash2"
arch=("x86_64")
url="https://github.com/explosion/murmurhash"
license=("MIT")
depends=("python" "cython" "python-pytest")
makedepends=("python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/murmurhash/archive/v$pkgver.tar.gz")
md5sums=('ea6f02a18d0624be81e1d857b71509be')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
