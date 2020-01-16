# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=uftpd
pkgver=2.11
pkgrel=1
pkgdesc="FTP/TFTP server for Linux that just works"
arch=('i686' 'x86_64')
url="https://github.com/troglobit/uftpd"
license=('ISC')
depends=('libite' 'libuev')
conflicts=('tftp-hpa' 'tftp-hpa-destruct')
source=(https://github.com/troglobit/uftpd/archive/v$pkgver.tar.gz)
md5sums=('b83ac2dea1b0b8ce9b9d606f60638c6a')

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
