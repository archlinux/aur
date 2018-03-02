# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Josh Marshall <jrmarsha@mtu.edu>
pkgname=hmmer
pkgver=3.1b2
pkgrel=2
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
checkdepends=('perl-perl4-corelibs')
license=('GPL')
url="http://hmmer.org/"
source=("http://eddylab.org/software/hmmer3/$pkgver/hmmer-$pkgver.tar.gz")
sha256sums=('dd16edf4385c1df072c9e2f58c16ee1872d855a018a2ee6894205277017b5536')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
