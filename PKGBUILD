# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-preshed
_origpkgname=preshed
pkgver=3.0.2
pkgrel=1
pkgdesc="Cython hash table that trusts the keys are pre-hashed"
arch=("x86_64")
url="https://github.com/explosion/preshed"
license=("MIT")
depends=("python" "python-cymem")
makedepends=("cython" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/preshed/archive/v$pkgver.tar.gz")
md5sums=("8a08bfdfecf33985f799e3aac102b14f")

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
