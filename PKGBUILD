# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-dock
pkgver=0.4
pkgrel=2
pkgdesc="CutefishOS application dock"
arch=('x86_64')
url="https://github.com/cutefishos/dock"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/dock/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3075014efa67cc42efd8a546a8dd5a2f4b210ab4c0dbf9effadb1650e5403b55dc816a76983e33048e56addfe5de2d93fee52622a306ad3ba09f7bda2701265d')

build() {
  cd dock-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock-$pkgver
  make DESTDIR="$pkgdir" install
}
