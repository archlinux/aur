# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbiff
pkgver=0.4.29
arch=('i686' 'x86_64')
pkgrel=1
pkgdesc="WindowMaker dock app that displays the number of read and unread messages in up to five mailboxes."
url="http://www.dockapps.net/wmbiff"
license=("GPL")
depends=('libxpm' 'gnutls')
optdepends=('ruby: to run security.debian.rb')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('9f3a729f7ff1063e38863589e53576a8')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
