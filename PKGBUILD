# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=proverif
pkgver=1.94
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('c4a7ebfde065a66690f37d74e346e61a91294182')
sha256sums=('a65c854d0b538053f0eb5b4550d8215cf6da486a1820c7dbb90a7873e6836237')

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
