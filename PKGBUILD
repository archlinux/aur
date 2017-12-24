# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=proverif
pkgver=1.98pl1
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('a259e6f7e4730c635936836472a29b1d7a549bf7')
sha256sums=('3edd1f6d9b0a2b9b066300f78af57cbf17b4e529c1184dd1d7892f9a6cca9390')

build() {
  cd "$srcdir/proverif$pkgver"
  ./build
}

check() {
  cd "$srcdir/proverif$pkgver"
  ./test all
  ./test-type all
}

package() {
  cd "$srcdir/proverif$pkgver"

  install -Dm755 proverif "$pkgdir/usr/bin/proverif"
  install -Dm755 proveriftotex "$pkgdir/usr/bin/proveriftotex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/proverif/LICENSE"
}
