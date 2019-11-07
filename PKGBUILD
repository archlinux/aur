# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=python-class
pkgname=("python-class" "python2-class")  
pkgver=2.7.2
pkgrel=1
pkgdesc="CLASS: Cosmic Linear Anisotropy Solving System"
arch=(any)
url="https://github.com/lesgourg/class_public"
license=()
groups=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('06a0debf48fc6f06e6e8c0b82c36929d9475874f2773de57d7cea4d57f1467c3')
package_python-class() {
  depends=('cython')
  cd "$srcdir/class_public-${pkgver}/"
  make -j libclass.a
  cd python
  sed -i 's/libraries=\["class"\]/libraries=["class", "mvec", "m"]/' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-class() {
  depends=('cython2')
  cd "$srcdir/class_public-${pkgver}/"
  make -j libclass.a
  cd python
  sed -i 's/libraries=\["class"\]/libraries=["class", "mvec", "m"]/' setup.py
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
