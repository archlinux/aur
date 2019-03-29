# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-blis
_origpkgname=cython-blis
pkgver=0.3.0
pkgrel=1
pkgdesc="The Blis linear algebra routines as a self-contained Python C-extension"
arch=("x86_64")
url="https://github.com/explosion/cython-blis"
license=("MIT")
depends=("cython" "python-numpy" "python-pytest" "python-hypothesis")
makedepends=("python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/cython-blis/archive/v$pkgver.tar.gz")
md5sums=('3e54170d679e1d0f6c797562381fe615')

package() {
    cd "$_origpkgname-$pkgver"
    export BLIS_COMPILER="gcc"
    export BLIS_ARCH="x86_64"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
