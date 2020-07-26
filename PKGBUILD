# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Josh Marshall <jrmarsha@mtu.edu>
pkgname=hmmer
pkgver=3.3.1
pkgrel=1
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
checkdepends=('perl-perl4-corelibs')
license=('GPL')
url="http://hmmer.org/"
source=(http://eddylab.org/software/hmmer/hmmer-$pkgver.tar.gz)
sha256sums=('8ce66a6930869534ad84bc7c9a5a566fd57188d6726c74c12fcd39c3c9c99bd5')

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
