pkgname=brightnessctl
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Hummer12007/brightnessctl/archive/$pkgver.tar.gz"
  90-backlight.rules
)
sha256sums=('decc8244c4770916c565d2a526e0c9df55343e7504b8b17a529637bb98083ba5'
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
