# Maintainer: Georgy Kibardin <georgy at kibardin.name>

pkgname=isync-utf8-mailboxes
pkgver=1.4.2
pkgrel=2
pkgdesc="IMAP and MailDir mailbox synchronizer"
arch=('x86_64')
url="http://isync.sourceforge.net"
conflicts=('isync')
provides=('isync')
license=('GPL2')
depends=('libsasl' 'zlib')
source=(git+https://git.code.sf.net/u/shashurup/isync#branch=utf8-mailboxes)
sha512sums=(SKIP)

build() {
  cd isync
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd isync

  make DESTDIR="$pkgdir" install
}
