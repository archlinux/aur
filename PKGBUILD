# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.8a2
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
sha256sums=('bb8b06183a5ccc64a8df98e3a9962523af5ed303b162266d7fefaa08e662c6de')

#check() {
#    cd "$srcdir/Fiona-$pkgver"
#    python setup.py build_ext --inplace
#    pytest
#}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
