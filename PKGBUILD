# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-stochpy
pkgver=2.3
pkgrel=1
pkgdesc="Stochastic simulation algorithms for SBML and PySCeS models"
arch=('i686' 'x86_64')
depends=('python2')
optdepends=('libsbml' 'python2-pysces' 'python2-matplotlib' 'libxml2')
url="http://stochpy.sourceforge.net/"
license=('BSD' 'GPL')
source=("https://sourceforge.net/projects/stochpy/files/StochPy-$pkgver/StochPy-$pkgver.zip")
md5sums=('10fa7b9584a57154d0ac78a49ed14786')

build() {
  cd "$srcdir/StochPy-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/StochPy-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}
