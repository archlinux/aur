pkgname="gutaur"
pkgver=1.0.3
pkgrel=1
pkgdesc="An AUR helper. PKGBUILD at https://github.com/gutenye/gutaur/tree/master/misc/aur"
arch=("any")
url="https://github.com/gutenye/gutaur"
license=("MIT")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gutenye/gutaur/archive/v${pkgver}.tar.gz"
  "https://github.com/gutenye/gutaur/releases/download/v1.0.0/gutaur-check-linux-amd64-v1.0.3.tar.gz"
  )
md5sums=('e6e2a5735f4550339e939a075963e79f'
         'fbf65249fe89e3d023a6be3e4aec633c')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp gutaur-check "$pkgdir/usr/bin"

	cd "$srcdir/$pkgname-$pkgver"
  ./ake package archlinux "$pkgdir"
}

# vim:set ts=2 sw=2 et fdm=marker:
