# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=hmmer2
_pkgname=hmmer
pkgver=2.4i
pkgrel=1
pkgdesc="Profile hidden Markov models (profile HMMs) for database searching using statistical descriptions of a sequence family's consensus"
arch=('i686' 'x86_64')
license=('GPL')
url='http://hmmer.janelia.org/'
depends=('glibc')
source=("ftp://selab.janelia.org/pub/software/hmmer/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('dab234c87e026ac1de942450750acd20')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make prefix="$pkgdir/usr" install 
}

