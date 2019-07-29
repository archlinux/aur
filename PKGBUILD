# Maintainer : Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.3.2
pkgrel=1
pkgdesc="Chan-SCCP channel driver for Asterisk"
arch=('i686' 'x86_64')
url="http://chan-sccp-b.sourceforge.net"
license=('GPL')
depends=('asterisk')
backup=('etc/asterisk/sccp.conf')
source=("https://github.com/chan-sccp/chan-sccp/archive/v${pkgver}-delta.tar.gz")
sha256sums=('34d859768458ed2696c455a44a0ef06774e4f77669b3f6fbdc74423a87aa2d03')

build() {
  cd ${srcdir}/chan-sccp-${pkgver}-delta
  ./configure --prefix=/usr
  make || return 1
}

package(){
  cd ${srcdir}/chan-sccp-${pkgver}-delta
  make DESTDIR="${pkgdir}" install || return 1
}

