# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=uftpd
pkgver=2.13
pkgrel=1
pkgdesc="FTP/TFTP server for Linux that just works"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/troglobit/uftpd"
license=('ISC')
depends=('libite' 'libuev')
conflicts=('tftp-hpa' 'tftp-hpa-destruct')
source=(https://github.com/troglobit/uftpd/archive/v$pkgver.tar.gz)
md5sums=('38b99ba0808e71e6d23cf1cf01340368')

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
