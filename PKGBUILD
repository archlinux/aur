# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Josh Marshall <jrmarsha@mtu.edu>
pkgname=hmmer
pkgver=3.3
pkgrel=1
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
checkdepends=('perl-perl4-corelibs')
license=('GPL')
url="http://hmmer.org/"
source=("http://eddylab.org/software/hmmer/hmmer-$pkgver.tar.gz")
sha256sums=('0186bf40af67032666014971ed8ddc3cf2834bebc2be5b3bc0304a93e763736c')

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
