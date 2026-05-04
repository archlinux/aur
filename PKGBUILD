pkgname=nmsurf
pkgver=1.0.3
pkgrel=1
pkgdesc="Fast NetworkManager frontend supports rofi, wofi, walker and fuzzel"
arch=('x86_64')
url="https://github.com/aayushkdev/nmsurf"
license=('MIT')

depends=('networkmanager')

optdepends=(
  'wofi'
  'rofi'
  'walker'
  'fuzzel'
)

provides=('nmsurf')
conflicts=('nmsurf')

options=('!debug')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/aayushkdev/nmsurf/releases/download/v$pkgver/nmsurf-linux-amd64.tar.gz"
)

sha256sums=('5e641c5840f513b8f3c55308fc095d12c5bf996d43b5a28cc7cdbce45f8ffb00')

package() {
  cd "$srcdir"

  install -Dm755 nmsurf "$pkgdir/usr/bin/nmsurf"

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
