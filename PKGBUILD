# Maintainer: s3my0n <rush4ck3r@gmail.com>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>, James Fryman <jfryman@gmail.com>

pkgname=firewalk
pkgver=5.0
pkgrel=4
pkgdesc="An active reconnaissance network security tool"
makedepends=()
arch=('i686' 'x86_64')
depends=('libdnet' 'libnet' 'libpcap')
source=(http://packetfactory.openwall.net/firewalk/dist/firewalk.tar.gz  firewalk-gcc3.4.patch)
url="http://packetfactory.openwall.net/projects/firewalk/"
md5sums=('02412f13218ea052427bbf038a88a026' 'd94be823c96efbaeee8f75941cfdd3b7')
license="BSD"


build() {
  cd $startdir/src/Firewalk
  patch -p1 < $startdir/firewalk-gcc3.4.patch
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $startdir/src/Firewalk
  make DESTDIR="$pkgdir" install 
}
