pkgname=arping-th
pkgver=2.25
pkgrel=1
pkgdesc="ARP Ping from Thomas Habets (aka Debian arping)"
arch=('i686' 'x86_64')
url="https://www.habets.pp.se/synscan/programs_arping.html"
license=('GPL')
depends=('libnet' 'libcap' 'libpcap')
source=("https://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz"
        "https://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz.asc")
sha256sums=('32f868e801e931033f058a614cce858f0a0b8f893331bbaddd6c5c1e46f2b1f0'
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
