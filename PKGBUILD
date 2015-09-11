# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=proverif
pkgver=1.91
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('e0307a04d3e3c4ea553fc746195f16e50780a5c6')
sha256sums=('ea2310199f2814da294572adc58a27edc7e1342a178859badd3cab01ce804ad2')

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
