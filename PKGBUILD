# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-stochpy
pkgver=1.1.5
pkgrel=1
pkgdesc="Stochastic simulation algorithms for SBML and PySCeS models"
arch=('i686' 'x86_64')
depends=('python2')
optdepends=('libsbml' 'python2-pysces' 'python2-matplotlib' 'libxml2')
url="http://stompy.sourceforge.net/"
license=('BSD' 'GPL')
source=("http://sourceforge.net/projects/stochpy/files/StochPy-1.1/StochPy-$pkgver.tar.bz2")
md5sums=('502308cba7e2786443b4b353ec26ae54')

build() {
    cd "$srcdir/StochPy-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/StochPy-$pkgver"
    python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}

