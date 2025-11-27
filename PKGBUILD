# Maintainer: Ashish Singh <ashish.singh1@live.in>

pkgname=swig40
pkgver=4.0.2
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
url="https://www.swig.org"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'pcre')
# optdepends=()
makedepends=('git')
arch=('any')
_commit=9bd3308061f02675eeab62aaf79f636dfc5c3ee8
source=("git+https://github.com/swig/swig.git#commit=${_commit}")
md5sums=('SKIP')

_basedir=/opt/swig-4.0.2

build() {
  cd "$srcdir/swig"
  ./autogen.sh
  ./configure --prefix=${_basedir}
  make
}

package() {
  cd "$srcdir/swig"
  make DESTDIR="$pkgdir" install
}
