# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Elrondo46 <elrond94@hotmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
pkgname=conspy
pkgver=1.17
pkgrel=1
pkgdesc="Remote control of Linux virtual consoles"
arch=('x86_64')
url="https://conspy.sourceforge.net/"
license=('AGPL-3.0-or-later')
depends=('ncurses')
source=("https://downloads.sourceforge.net/project/conspy/conspy-$pkgver-$pkgrel/conspy-$pkgver.tar.gz")
sha256sums=('61230ef6c5898dcfb3a8cb60d218c8458588d97367a90d9538b66f1d94990b64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install

  local _docdir="$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.txt "$_docdir/README.txt"
  install -Dm644 ChangeLog.txt "$_docdir/ChangeLog.txt"
}
