# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-wallpapers
pkgver=0.1
pkgrel=1
pkgdesc="CutefishOS's system wallpaper"
arch=('any')
url="https://github.com/cutefishos/wallpapers"
license=('GPL')
groups=('cutefish')
depends=()
makedepends=('cmake' 'ninja')
source=("https://github.com/cutefishos/wallpapers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5b921ae69ba31c5745e789af4b121338163ff2df3c1d5a9a5ff00a950731de0bbe9d82480eac12d3ab2b59fcda51ca467c316a546b5f76b35470953a0757e5ef')

build() {
  cd wallpapers-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd wallpapers-$pkgver
  DESTDIR="$pkgdir" ninja install
}
