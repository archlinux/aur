pkgname=brightnessctl
pkgver=0.3
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Hummer12007/brightnessctl/archive/$pkgver.tar.gz"
  90-backlight.rules
)
sha256sums=('f05cb357a300ec04b0bbbe967436354fc97c5cdce36e2a682721b6ae1fb3b42e'
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
