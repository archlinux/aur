# Maintainer : Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.2.3
pkgrel=1
pkgdesc="Chan-SCCP channel driver for Asterisk"
arch=('i686' 'x86_64')
url="http://chan-sccp-b.sourceforge.net"
license=('GPL')
depends=('asterisk')
backup=('etc/asterisk/sccp.conf')
source=("https://github.com/chan-sccp/chan-sccp/archive/v${pkgver}.tar.gz")
sha256sums=('d89d2e1102f0ef85e4acec614b08bd210918cfc161ddae7c61c540848499a18d')

build() {
  cd ${srcdir}/chan-sccp-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package(){
  cd ${srcdir}/chan-sccp-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
}

