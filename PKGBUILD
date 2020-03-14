# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Elrondo46 <elrond94@hotmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
pkgname=conspy
pkgver=1.14
pkgrel=1
pkgdesc="Remote control of Linux virtual consoles"
arch=('x86_64' 'i686' 'armv6h')
url="http://conspy.sourceforge.net/"
license=('AGPL3')
depends=('ncurses')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/conspy/conspy-$pkgver-$pkgrel/conspy-$pkgver.tar.gz")
sha256sums=('4e2f05c9e19a6673a323127711ff007f7f9244f3a5c793c2b079eb7fbb113319')

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
