# Maintainer: Quentin Bourgeois <quentin@bourgeois.eu>
#
# TODO: * Can we put a check per pkgname ?
#       * Can we sign the PKGBUILD with GPG ?
#       * Check if python-pillow is the right deps for PIL
libname=viivakoodi
pkgname=("python2-$libname" "python-$libname")
softver=0.8
softrev=0
pkgver=$softver.$softrev
pkgrel=0
pkgdesc='Barcode generator for Python. Fork of pyBarcode project.'
arch=('any')
url="https://github.com/kxepal/$libname"
license=('GPL')
source=("$libname-$pkgver.tar.gz::https://github.com/kxepal/$libname/archive/$pkgver.tar.gz")
sha256sums=('e1a17dc24975d5242202cfbb7534d69dd14eeb26bdf8a10f056c7b04904fef1e')

check() {
        cd "$srcdir/$libname-$pkgver"

        msg "Testing $libname-$pkgver with python3"
        python ./setup.py test
}
check() {
        msg "I AM TESTING"
}

check_python-viivakoodi() {
  msg "I A AM TESTING PYTHON3"                                  
}

package_python-viivakoodi() {
  depends=('python')
  provides=('python2-viivakoodi')
  optdepends=('python-pillow')

  cd "$srcdir/$libname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-viivakoodi() {
  depends=('python2')          
  provides=('python2-viivakoodi')
  optdepends=('python2-pillow')

  cd "$srcdir/$libname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}