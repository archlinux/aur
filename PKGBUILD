pkgname=nmsurf
pkgver=1.0.2
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

sha256sums=('be020557f1147583e48c8197402ceef036911dc7e51b767a554c0bc7c474c3a1')

package() {
  cd "$srcdir"

  install -Dm755 nmsurf "$pkgdir/usr/bin/nmsurf"

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
