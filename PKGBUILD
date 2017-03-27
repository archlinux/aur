_projname=arping
_suffix=-th # this is to avoid clashing with iputils
pkgname=${_projname}${_suffix}
pkgver=2.18
pkgrel=1
pkgdesc="ARP Ping from Thomas Habets"
arch=('i686' 'x86_64')
url="http://www.habets.pp.se/synscan/programs.php?prog=arping"
license=('GPL')
depends=('libnet' 'libcap' 'libpcap')
source=("http://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz"
        "http://www.habets.pp.se/synscan/files/arping-$pkgver.tar.gz.asc")
sha256sums=('2b97c797969a597af6715c306ab03bb9c851fbc45c0378def257e8e2d57bf869'
            'SKIP')
validpgpkeys=('990786988A24F52F1C2E87F639A49EEA460A0169') # Thomas Habets

build() {
	cd "arping-$pkgver"
	./configure --prefix=/usr --program-suffix=${_suffix} --sbindir=/usr/bin
	make
}

package() {
	cd "arping-$pkgver"
	make DESTDIR="$pkgdir/" install
}
