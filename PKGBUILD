# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.7.9
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
sha256sums=('cc24a4c5fe0db05d10bfbac3ef9511e23fe22252d833edf138154af005f31c95')

#check() {
#    cd "$srcdir/Fiona-$pkgver"
#    python setup.py build_ext --inplace
#    pytest
#}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
