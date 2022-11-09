# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Elrondo46 <elrond94@hotmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
pkgname=conspy
pkgver=1.16
pkgrel=1
pkgdesc="Remote control of Linux virtual consoles"
arch=('x86_64' 'i686' 'armv6h')
url="https://conspy.sourceforge.net/"
license=('AGPL3')
depends=('ncurses')
changelog=ChangeLog
source=("https://downloads.sourceforge.net/project/conspy/conspy-$pkgver-$pkgrel/conspy-$pkgver.tar.gz")
sha256sums=('ee5ef648ea08d20d9062db22e7bf62a7b7261af02053f916016d1b80a66a5609')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install

  _docdir="$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.txt "$_docdir/README.txt"
  install -Dm644 ChangeLog.txt "$_docdir/ChangeLog.txt"
}
