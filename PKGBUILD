# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=hmmer
pkgver=3.1b1
pkgrel=2
pkgdesc="Profile hidden Markov models (profile HMMs) for database searching using statistical descriptions of a sequence family's consensus"
arch=('i686' 'x86_64')
license=('GPL')
url='http://hmmer.janelia.org/'
depends=('glibc')
source=("http://selab.janelia.org/software/hmmer3/$pkgver/hmmer-$pkgver.tar.gz")
md5sums=('e81b689fe1dd7625cff84c08cbead1fc')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

