# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-pysces
_pkgname=pysces
pkgver=0.9.0
_pkgver=0.9
pkgrel=1
pkgdesc="Python simulator for Cellular Systems"
arch=('i686' 'x86_64')
depends=('python2-scipy' 'python2-matplotlib')
optdepends=('gnuplot: as an alternative plotting back-end and 3D plots'
            'ipython2: for interactive modelling sessions (highly recommended)'
            'libsbml: for SBML import and export'
            'python2-pysundials: for CVODE and Events support'
            'python2-pysces-metatool: for elementary mode support')
makedepends=('gcc-fortran')
url="http://pysces.sourceforge.net/"
license=('BSD' 'GPL')
replaces=('pysces')
source=("http://sourceforge.net/projects/pysces/files/pysces/pysces-$_pkgver/pysces-$pkgver.tar.gz" "setup.py.patch")
md5sums=('d325c6e35011f614d8be90b94f7f7110'
         '0a85b753d42fc5ed037f96df8f199b76')

prepare() {
    cd "$srcdir/pysces-$pkgver"
    patch -p0 < "$srcdir/setup.py.patch"
}

build() {
    cd "$srcdir/pysces-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/pysces-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir/" --skip-build --optimize=1
}

