# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-preshed
_origpkgname=preshed
pkgver=3.0.8
pkgrel=1
pkgdesc="Cython hash table that trusts the keys are pre-hashed"
arch=("x86_64")
url="https://github.com/explosion/preshed"
license=("MIT")
depends=("python" "python-cymem" "python-murmurhash")
makedepends=("cython" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/preshed/archive/v$pkgver.tar.gz")
md5sums=('07b70ae92d49d180798d491c64b0e4b8')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
