# Contributor: danitool
pkgname=dhd
pkgver=2.1
pkgrel=1
pkgdesc="Ultra-fast dhcp discovery"
url="http://www.latinsud.com/pub/dhd/"
license=("GPL")
depends=('libnet' 'libpcap')
makedepends=('gcc')
arch=('i686' 'x86_64')
#source=(http://www.latinsud.com/pub/dhd/dhd.c)
source=(dhd.c)
md5sums=('e50f7489136412a602cf47fd1fd382e2')

build() {
  cd $srcdir
  gcc -o dhd dhd.c -lnet -lpcap -lpthread || return 1
}

package() {
  install -m 755 -D dhd $pkgdir/usr/bin/dhd || return 1
}
