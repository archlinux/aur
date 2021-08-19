# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-wallpapers
pkgver=0.4
pkgrel=1
pkgdesc="CutefishOS's system wallpaper"
arch=('any')
url="https://github.com/cutefishos/wallpapers"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('cmake' 'ninja')
source=("https://github.com/cutefishos/wallpapers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9e0aefe4ac1f44f8fdd25048017e238c2939f391909ad1a116f90eea25e6810b9fe8def9b1300c2943984eded6f2d7a92cd62927f8dd196968bc3a6e8a10c73c')

build() {
  cd wallpapers-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd wallpapers-$pkgver
  DESTDIR="$pkgdir" ninja install
}
