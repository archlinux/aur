# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Josh Marshall <jrmarsha@mtu.edu>
pkgname=hmmer2
_pkgname=hmmer
pkgver=2.4i
pkgrel=3
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
checkdepends=('perl-perl4-corelibs')
license=('GPL')
url="http://hmmer.org/"
source=("http://eddylab.org/software/hmmer/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('73cb85c2197017fa7a25482556ed250bdeed256974b99b0c25e02854e710a886')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

package() {
  cd "$_pkgname-$pkgver"
  make prefix="$pkgdir"/usr install
  find "$pkgdir" -type f -exec mv {} {}2 \;
}
