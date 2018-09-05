pkgname=arping-th
pkgver=2.19
pkgrel=1
pkgdesc="ARP Ping from Thomas Habets"
arch=('i686' 'x86_64')
url="http://www.habets.pp.se/synscan/programs.php?prog=arping"
license=('GPL')
depends=('libnet' 'libcap' 'libpcap')
source=("http://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz"
        "http://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz.asc")
sha256sums=('36e97b58076dcd478cf732682e828ec00026dd8ec8f63201d147960be25e6616'
            'SKIP')
validpgpkeys=('990786988A24F52F1C2E87F639A49EEA460A0169') # Thomas Habets

build() {
  cd "arping-$pkgver"
  ./configure --prefix=/usr --program-suffix="-th" --sbindir=/usr/bin
  make
}

package() {
  cd "arping-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim: ts=2:sw=2:et
