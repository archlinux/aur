pkgname=dhcp_probe
pkgver=1.3.0
pkgrel=4
pkgdesc="Allows network administrators to make calculations that will assist in subnetting a network"
arch=('i686' 'x86_64')
url="http://www.net.princeton.edu/software/dhcp_probe/"
license=('GPL')
source=(http://www.net.princeton.edu/software/dhcp_probe/$pkgname-$pkgver.tar.gz)
md5sums=('8067e696fbd88120bdcc2ffef4b64da2')
depends=('libnet')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
