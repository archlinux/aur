pkgname=brightnessctl
pkgver=0.3.1
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Hummer12007/brightnessctl/archive/$pkgver.tar.gz"
  90-backlight.rules
)
sha256sums=('3e81dfa7c5faba29df88a7c4569c7ebaf511c3de4d489a8c8e305ab51b9e3059'
            '16ce09fbfcb7111cd62377160255f6d7b5559c6915719c05aa76d69591a632eb')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
