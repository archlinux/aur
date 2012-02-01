# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=brightmare
pkgver=0.34.2
pkgrel=1
pkgdesc="A tool that translates LaTeX equations to ASCII/UTF-8 text"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/brightmare"
license=('GPL2')
makedepends=('ocaml')
source=("http://jwilk.net/pool/brightmare_$pkgver.tar.gz")
sha256sums=('55b40685fabbf2bd05ec7667f2077e0bd9f0a51c665d9ac2bdd4f949bf1795c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/brightmare" "$pkgdir/usr/bin/brightmare"
  ln -s /usr/bin/brightmare "$pkgdir/usr/bin/brightmare-html"
}

# vim:set ts=2 sw=2 et:
