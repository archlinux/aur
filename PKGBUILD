# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-wallpapers
pkgver=0.2
pkgrel=1
pkgdesc="CutefishOS's system wallpaper"
arch=('any')
url="https://github.com/cutefishos/wallpapers"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('cmake' 'ninja')
source=("https://github.com/cutefishos/wallpapers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0d0c219dfa6b5b5a841ff588c64f68bea57a0546d13e3570d01196efe610269ed711398614aab5664d14b0e5c776514744a2afb4b96d6870a30df32aaf429772')

build() {
  cd wallpapers-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd wallpapers-$pkgver
  DESTDIR="$pkgdir" ninja install
}
