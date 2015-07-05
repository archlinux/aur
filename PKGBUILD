# Contributors:
#   henning mueller <henning@orgizm.net>
#   Ariel Popper <a@arielp.com>

pkgname=thc-ipv6
pkgver=2.5
pkgrel=1
pkgdesc='A complete tool set to attack the inherent protocol weaknesses of IPv6 and ICMP6, and includes an easy to use packet factory library.'
url='http://thc.org/thc-ipv6/'
depends=(libpcap openssl)
arch=(i686 x86_64)
license=(GPL)
source=(
  http://www.thc.org/releases/$pkgname-$pkgver.tar.gz
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

sha256sums=('52120bee2da3d25820f021b5c4d6fc79e220e685e2a505b74b48046b608cba8c')
