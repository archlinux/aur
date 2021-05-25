# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-dock
pkgver=0.1
pkgrel=1
pkgdesc="CutefishOS application dock"
arch=('x86_64')
url="https://github.com/cutefishos/dock"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/dock/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('df294fb599709a039f8e73aef81edb84b294b6d367dddd7c381a982628023762b5d7e2194c82c25ec2d1c858823091e207426c06b18721a443049a47235291f7')

build() {
  cd dock-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock-$pkgver
  make DESTDIR="$pkgdir" install
}
