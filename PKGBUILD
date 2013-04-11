# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbiff
pkgver=0.4.27
arch=('i686' 'x86_64')
pkgrel=2
pkgdesc="WindowMaker dock app that displays the number of read and unread messages in up to five mailboxes."
url="http://wmbiff.sourceforge.net/"
license=("GPL")
depends=('libxpm' 'libgcrypt')
optdepends=('ruby: to run security.debian.rb')
source=("http://downloads.sourceforge.net/wmbiff/wmbiff-0.4.27.tar.gz")
md5sums=('50466b6e4a143cf4e55546b34d5792e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

