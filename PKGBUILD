# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.8a1
pkgrel=1
pkgdesc="Reads and writes spatial data files"
arch=('any')
url="https://github.com/Toblerity/Fiona"
license=('BSD')
checkdepends=('python-click-plugins' 'python-pytest')
depends=('python' 'python-six' 'python-cligj' 'python-munch' 'gdal')
makedepends=('cython')
optdepends=('python-click-plugins: for fio command line tool.')
options=(!emptydirs)
source=("https://github.com/Toblerity/Fiona/archive/$pkgver.tar.gz")
sha256sums=('1a229bb511b0b228357556251a2c66c9a96e4321b195e2c67b996b8f93c78283')

#check() {
#    cd "$srcdir/Fiona-$pkgver"
#    python setup.py build_ext --inplace
#    pytest
#}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
