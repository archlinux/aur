# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-m17n
pkgver=0.2.4
pkgrel=2
pkgdesc="Fcitx Wrapper for m17n"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-m17n"
license=('GPL')
depends=('fcitx' 'm17n-lib')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")  # {,.sig})
sha512sums=('b7c483e9c88e58a47ead294c36ed182558f09b41996e97faaba9fd3a96612f6a0fc240fdcb95db9a08c1546abe5fc97337957e2124844bd011363b7468f6e112')
# validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build() {
  cd $pkgname-$pkgver
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
