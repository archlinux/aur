# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>
pkgname='cadabra2-git'
pkgver=2.2.7
pkgrel=1
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.science/"
license=('GPL')
conflicts=('cadabra2')
depends=(
  'boost-libs'
  'glibmm'
  'gmp'
  'gtkmm3'
  'jsoncpp'
  'mathjax'
  'pcre'
  'python-matplotlib'
  'python-sympy'
  'texlive-core'
)
makedepends=(
  'boost'
  'cmake'
)
source=("https://github.com/kpeeters/cadabra2/archive/${pkgver}.tar.gz")
md5sums=('95feb70c09aca94a2149adbe4e754f4f')

build() {
  cd "$srcdir/cadabra2-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_SKIP_RPATH=true -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/cadabra2-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}
