# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-preshed
_origpkgname=preshed
pkgver=2.0.1
pkgrel=1
pkgdesc="Cython hash table that trusts the keys are pre-hashed"
arch=("x86_64")
url="https://github.com/explosion/preshed"
license=("MIT")
depends=("python" "python-cymem")
makedepends=("cython" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/preshed/archive/v$pkgver.tar.gz")
md5sums=("2ca8b963cc7e4bd4fb4e5ede428acd5c")

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
