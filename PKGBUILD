# Contributor: Raymond Wagenmaker <raymondwagenmaker at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ledit
pkgver=2.04
pkgrel=1
pkgdesc="Line editor, allowing to use shell commands with control characters like in Emacs."
arch=('i686' 'x86_64')
url="http://cristal.inria.fr/~ddr/ledit/"
license=('BSD')
depends=('ncurses')
makedepends=('ocaml' 'camlp5')
options=(!strip)
source=("http://cristal.inria.fr/~ddr/ledit/distrib/src/$pkgname-$pkgver.tgz")
md5sums=('96ac3200b2a57591776e2d8840846186')
sha1sums=('7b511f9b3f43d5eb2cb10e080c3391f4b28592e0')
sha256sums=('484897016b001b6d64eb24e38a213177b230ebf8e0d9808a969b62f012e70ee4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  OCAMLPARAM="safe-string=0,_" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man/man1" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

