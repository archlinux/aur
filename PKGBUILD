# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=proverif
pkgver=1.90
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('e083b1fac9003d291dde35cb188f0344ade7849e')
sha256sums=('7132729a7674c8c71414d0f0d9a86f6cb4aae7552598a8cd8b0239673521a991')

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
