# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-sunpinyin
pkgver=0.4.2
pkgrel=2
pkgdesc="Fcitx Wrapper for sunpinyin, Statistical Language Model based pinyin IME by Sun"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-sunpinyin"
license=('GPL')
depends=('fcitx' 'sunpinyin' 'sunpinyin-data' 'gtk-update-icon-cache')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")  # {,.sig})
sha512sums=('8ade5d94e5227c0b72d2844c09c2699e4b8c66cecbd4107791168d27e15f68b28a4445bf42df7bd6fb44119ec42c5b574293bb417dcde8998578f0debd656a2a')
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
