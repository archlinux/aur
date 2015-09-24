# Contributors:
#   henning mueller <mail@nning.io>
#   Ariel Popper <a@arielp.com>
#   mortzu <me@mortzu.de>

pkgname=thc-ipv6
pkgver=2.7
pkgrel=1
pkgdesc='A complete tool set to attack the inherent protocol weaknesses of IPv6 and ICMP6, and includes an easy to use packet factory library.'
url='http://thc.org/thc-ipv6/'
depends=(libpcap openssl)
arch=(i686 x86_64)
license=(GPL)
source=(
  https://www.thc.org/releases/$pkgname-$pkgver.tar.gz
)
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

sha256sums=('440a3ae98b57100c397ec4f8634468dbbb0c3b48788c6b74af2a597a90544a96')
