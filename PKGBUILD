pkgname=arping-th
pkgver=2.22
pkgrel=1
pkgdesc="ARP Ping from Thomas Habets (aka Debian arping)"
arch=('i686' 'x86_64')
url="https://www.habets.pp.se/synscan/programs_arping.html"
license=('GPL')
depends=('libnet' 'libcap' 'libpcap')
source=("https://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz"
        "https://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz.asc")
sha256sums=('cb40de7e146375063b2af674ef4d61d7aaf3ac2e0c3ad1cca46c6b4229ba533a'
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
