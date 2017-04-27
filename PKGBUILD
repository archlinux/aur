# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-sunpinyin
pkgver=0.4.1
pkgrel=3
pkgdesc="Fcitx Wrapper for sunpinyin, Statistical Language Model based pinyin IME by Sun"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'sunpinyin' 'sunpinyin-data' 'gtk-update-icon-cache')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")  # {,.sig})
sha512sums=('7ad9065d86d7bb3ceb6536a0fe3559bf2ba60aebe69e2f07c8dadad1a0a2283a1b85712105c6c2a2bf19b9645c4392204db9c3d1db234618ba7f62ee44eda85c')
# validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
