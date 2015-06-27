# Maintainer: James Spencer <james.s.spencer@gmail.com>
pkgname=python-hypothesis
pkgver=1.6.0
pkgrel=1
pkgdesc="Advanced Quickcheck style testing for Python"
arch=('any')
url="https://github.com/DRMacIver/hypothesis"
license=('MPL')
depends=('python')
makedepends=('python-pytest' 'flake8')
options=(!emptydirs)
source=(https://github.com/DRMacIver/hypothesis/archive/v${pkgver}.tar.gz)
sha1sums=('c0da94d0dc812e256c77e2dc904794d865499fd4') 


check() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
