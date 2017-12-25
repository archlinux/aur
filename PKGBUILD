# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=uftpd
pkgver=2.4
pkgrel=1
pkgdesc="FTP/TFTP server for Linux that just works"
arch=('i686' 'x86_64')
url="https://github.com/troglobit/uftpd"
license=('ISC')
depends=('libite' 'libuev')
source=(https://github.com/troglobit/uftpd/archive/v$pkgver.tar.gz)
md5sums=('6232051a5a8d37ef8ad0d0f7680ffead')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin \
    --localstatedir=/var --sysconfdir=/etc
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
