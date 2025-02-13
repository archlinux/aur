# Maintainer: Marco Costanzo <thedumberspacecore096 at gmail dot com>
pkgname=yogabook-initcpio-hook
pkgver=1.0
pkgrel=1
pkgdesc="YogaBook touch keyboard handler hook for initcpio"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(yogabook-touch-keyboard)
source=(yb-keyboard 60-touch-keyboard.rules yb-kbd-handler.sh)
sha256sums=(
  '1b24c5d6581533f42eee45114e81d7e71fb86dbe4fbca166f853cbda419ef9c7'
  'f691dc2684593a48f9c8129e1bdf3103174fa6297c94c7679180a891b028e583'
  'a584a5872472b34eccabc2cca1aa11d0e4c8e6793e0f6305b94b1975e050a5c5'
)

package() {
  install -Dm644 -t "$pkgdir/usr/lib/initcpio/install" ${source[0]}
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" ${source[1]}
  install -Dm755 -t "$pkgdir/usr/share/$pkgname" ${source[2]}
}
