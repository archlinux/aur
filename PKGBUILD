# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbiff
pkgver=0.4.28.20151026
arch=('i686' 'x86_64')
pkgrel=1
pkgdesc="WindowMaker dock app that displays the number of read and unread messages in up to five mailboxes."
url="http://wmbiff.sourceforge.net/"
license=("GPL")
depends=('libxpm' 'gnutls')
optdepends=('ruby: to run security.debian.rb')
source=("${pkgname}-${pkgver}.tar.gz::http://windowmaker.org/dockapps/?download=wmbiff-0.4.28+20151026.tar.gz")
md5sums=('SKIP')

prepare() {
  cd dockapps-*
  autoreconf -fiv
}

build() {
  cd dockapps-*
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd dockapps-*
  make DESTDIR="$pkgdir" install
}
