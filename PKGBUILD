# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=uftpd
pkgver=2.7
pkgrel=1
pkgdesc="FTP/TFTP server for Linux that just works"
arch=('i686' 'x86_64')
url="https://github.com/troglobit/uftpd"
license=('ISC')
depends=('libite' 'libuev')
source=(https://github.com/troglobit/uftpd/archive/v$pkgver.tar.gz)
md5sums=('d2b6ef2426b412fc23deb3d86f850149')

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
