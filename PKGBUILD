# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic < gostrc at gmail >
pkgname=hmmer
pkgver=3.1b2
pkgrel=1
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
license=('GPL')
url="http://hmmer.org/"
source=("http://eddylab.org/software/hmmer3/$pkgver/hmmer-$pkgver.tar.gz")
md5sums=('c8c141018bc0ccd7fc37b33f2b945d5f')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
