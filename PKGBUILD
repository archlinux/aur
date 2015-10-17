# Contributors:
#   henning mueller <mail@nning.io>
#   Ariel Popper <a@arielp.com>
#   mortzu <me@mortzu.de>

pkgname=thc-ipv6
pkgver=3.0
pkgrel=1
pkgdesc='A complete tool set to attack the inherent protocol weaknesses of IPv6 and ICMP6, and includes an easy to use packet factory library.'
url='http://thc.org/thc-ipv6/'
depends=(libpcap openssl libnetfilter_queue)
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

sha256sums=('cec2db604e3fe59f26ddc42632d858f53660ef5d6e25d6a7e90ed927f6826102')
