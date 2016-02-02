# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=hmmer2
_pkgname=hmmer
pkgver=2.3.2
pkgrel=1
pkgdesc="Profile hidden Markov models (profile HMMs) for database searching using statistical descriptions of a sequence family's consensus"
arch=('i686' 'x86_64')
license=('GPL')
url="http://hmmer.org/"
source=("http://eddylab.org/software/hmmer/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('5f073340c0cf761288f961a73821228a')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make prefix="$pkgdir/usr" install 
}
