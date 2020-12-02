# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Josh Marshall <jrmarsha@mtu.edu>
pkgname=hmmer
pkgver=3.3.2
pkgrel=1
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
checkdepends=('perl-perl4-corelibs')
license=('GPL')
url="http://hmmer.org/"
source=(http://eddylab.org/software/hmmer/hmmer-$pkgver.tar.gz)
sha256sums=('92fee9b5efe37a5276352d3502775e7c46e9f7a0ee45a331eacb2a0cac713c69')

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
