# Maintainer: Sebastien MacDougall-Landry

pkgname=soloud
pkgver=20200207
pkgrel=2
pkgdesc='Free, easy, portable audio engine for games'
url='http://soloud-audio.com/'
source=("RELEASE_$pkgver.tar.gz::https://github.com/jarikomppa/soloud/archive/refs/tags/RELEASE_$pkgver.tar.gz")
arch=('x86_64')
license=('zlib')
makedepends=('genie-git')
sha256sums=('922a10b287dcd12de5cfdfed2fac12b228517c4dd55eeb893c565048f30ae5f6')

build () {
  cd "$srcdir/$pkgname-RELEASE_$pkgver"
  cd build
  genie gmake
  cd gmake
  make config=release
}

package () {
  cd "$srcdir/$pkgname-RELEASE_$pkgver"
  install -Dm755 lib/libsoloud.so -t "$pkgdir/usr/lib"
  install -Dm644 include/*.h -t "$pkgdir/usr/include/soloud"
}
