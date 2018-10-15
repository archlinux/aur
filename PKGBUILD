# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=uftpd
pkgver=2.6
pkgrel=1
pkgdesc="FTP/TFTP server for Linux that just works"
arch=('i686' 'x86_64')
url="https://github.com/troglobit/uftpd"
license=('ISC')
depends=('libite' 'libuev')
source=(https://github.com/troglobit/uftpd/archive/v$pkgver.tar.gz)
md5sums=('87a039ccf1c53a6fdae1fa9b93e51bbe')

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
