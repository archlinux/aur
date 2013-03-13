# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=brightmare
pkgver=0.35
pkgrel=1
pkgdesc="A tool that translates LaTeX equations to ASCII/UTF-8 text"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/brightmare"
license=('GPL2')
makedepends=('ocaml')
source=("http://jwilk.net/pool/brightmare_$pkgver.tar.gz")
sha256sums=('6a3929c1b6a1026c8773481d2204ff336a0399024a244b771fc6bd1bf7557549')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/brightmare" "$pkgdir/usr/bin/brightmare"
  ln -s /usr/bin/brightmare "$pkgdir/usr/bin/brightmare-html"
}

# vim:set ts=2 sw=2 et:
