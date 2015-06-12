# Maintainer: Olivier Mangin <olivier.mangin@inria.fr>
pkgname=python2-nimfa-git
pkgver=1.2.r18.g5560279
pkgrel=1
pkgdesc="A Python Library for Nonnegative Matrix Factorization Techniques"
arch=('any')
url="http://nimfa.biolab.si/"
license=('GPL')
depends=('python2')
makedepends=('git')
source=($pkgname::git+https://github.com/marinkaz/MF.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
