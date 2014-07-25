# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-fte
pkgver=0.0.4
pkgrel=2
pkgdesc="Implementation of Format-Transforming Encryption (FTE)"
arch=('i686' 'x86_64')
url="https://github.com/kpdyer/libfte"
license=('GPL')
depends=('python2' 'gmp>=5.1')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/f/fte/fte-${pkgver}.tar.gz")
sha256sums=('0803946562e07693f43954943c4902c92504e2440afe30f9f68f374a1f4bef91')

prepare() {
  cd "$srcdir/fte-$pkgver"
  sed -i 's/PYTHON="python"/PYTHON="python2"/' Makefile
}

build() {
  cd "$srcdir/fte-$pkgver"
  CXXFLAGS="${CXXFLAGS} -fPIC" make
}

package() {
  cd "$srcdir/fte-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
