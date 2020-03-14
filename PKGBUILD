# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.3.2
pkgrel=3
pkgdesc='Fcitx Wrapper for librime'
arch=('x86_64')
url="https://github.com/fcitx/fcitx-rime"
license=('GPL')
depends=('fcitx' 'librime')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('8c6d845b0899d9b8b9b41b895abd5c1b8916856b71f529aabd08d1c27a2b09bb5a9343912d088da460c2e22da0a3ce759a34fd13099a149bb8cd1ff4eafe29f1'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
