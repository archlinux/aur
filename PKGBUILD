pkgname=ip-sentinel
pkgver=0.12
pkgrel=4
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="prevent usage of IPs by giving answers to ARP-requests"
depends=('glibc')
source=(http://savannah.nongnu.org/download/ip-sentinel/$pkgname-$pkgver.tar.bz2)
md5sums=('eb83cda53fcfed7d9826eab1640a2d2a')
url="http://www.nongnu.org/ip-sentinel/"

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix="$pkgdir/usr" --sbindir="$pkgdir/usr/bin"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install
}
