# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="CutefishOS's system wallpaper"
arch=('any')
url="https://github.com/cutefishos/wallpapers"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('cmake' 'ninja')
source=("https://github.com/cutefishos/wallpapers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ea4d4d236b62993d2f5e3fb057fee50928318445da6e645703d637492fde0393c398d31aaed23d7274a88846452190c2b55868561e5c674520238033b77d1804')

build() {
  cd wallpapers-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd wallpapers-$pkgver
  DESTDIR="$pkgdir" ninja install
}
