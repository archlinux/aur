# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Josh Marshall <jrmarsha@mtu.edu>
pkgname=hmmer
pkgver=3.4
pkgrel=1
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
license=('GPL')
url="http://hmmer.org/"
source=(https://github.com/EddyRivasLab/hmmer/archive/refs/tags/hmmer-$pkgver.tar.gz)
sha256sums=('298cbe76ccc516a86a85cbe2e91690074deed1d66b19d88ff6829a837befd85e')

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
