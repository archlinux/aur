pkgname=brightnessctl
pkgver=0.1.1_p2
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Hummer12007/brightnessctl/archive/$pkgver.tar.gz"
  90-backlight.rules
)
sha256sums=('9edfdeb03ce38439236ef99e5c719c69424be408aa6f2640c76e9ab88e1e5da4'
            '16ce09fbfcb7111cd62377160255f6d7b5559c6915719c05aa76d69591a632eb')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
