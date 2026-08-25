# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqm-scripts
pkgver=1.8.0
pkgrel=1
pkgdesc="SQM scripts traffic shaper"
arch=('any')
url="https://github.com/tohojo/sqm-scripts"
license=('GPL-2.0-or-later')
depends=('sh' 'iproute2' 'nftables')
makedepends=('systemd') # workaround: otherwise sqm@.service ends up at the wrong directory
source=("$pkgname-$pkgver.tar.gz::https://github.com/tohojo/sqm-scripts/archive/v$pkgver.tar.gz")
sha256sums=('45fd80be8be26bc7ec53cbd2fd40d7c2f4b569553b76e43c3cd0842ba1085a68')


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
