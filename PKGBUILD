# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-fte
pkgver=0.1.0
pkgrel=1
pkgdesc="Implementation of Format-Transforming Encryption (FTE)"
arch=('i686' 'x86_64')
url="https://github.com/kpdyer/libfte"
license=('GPL')
depends=('python2' 'gmp>=5.1')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/f/fte/fte-${pkgver}.tar.gz")
sha256sums=('6c4900b2ce4554d6101665a446ca5bd2ca84bb6786913a855edcedb1b142e740')

build() {
  cd "$srcdir/fte-$pkgver"
  python2 setup.py build
}

#check() {
#  cd "$srcdir/fte-$pkgver"
#  python2 setup.py test
#}

package() {
  cd "$srcdir/fte-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
