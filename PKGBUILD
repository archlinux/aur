# Contributor: Raymond Wagenmaker <raymondwagenmaker at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ledit
pkgver=2.03
pkgrel=1
pkgdesc="Line editor, allowing to use shell commands with control characters like in Emacs."
arch=('i686' 'x86_64')
url="http://cristal.inria.fr/~ddr/ledit/"
license=('BSD')
depends=('ncurses')
makedepends=('ocaml' 'camlp5')
options=(!strip)
source=("http://cristal.inria.fr/~ddr/ledit/distrib/src/$pkgname-$pkgver.tgz")
md5sums=('3a70ee7d5d5e2dfb905a1ac2e1e60276')
sha1sums=('8fef728f38e8d6fc30dd5f71dd5b6b647212a43a')
sha256sums=('ce08a8568c964009ccb0cbba45ae78b9a96c823f42a4fd61431a5b0c2c7a19ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man/man1" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

