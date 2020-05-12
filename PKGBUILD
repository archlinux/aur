# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=proverif
pkgver=2.01
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
makedepends=('ocamlbuild' 'ocaml-findlib' 'lablgtk2')
optdepends=('graphviz: for displaying graphs of found attacks')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('b55a942a25f462013e575924baa0706b6b9c69ad')
sha256sums=('b1bf1496c5aebfa3c0f311317ca99626435faa5d08a6a49402ff1c1606299707')

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
