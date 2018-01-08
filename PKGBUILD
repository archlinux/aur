# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-chewing
pkgver=0.2.3
pkgrel=2
pkgdesc='Fcitx Wrapper for chewing'
arch=('x86_64')
url="https://github.com/fcitx/fcitx-chewing"
license=('GPL')
depends=('libchewing' 'fcitx')
makedepends=('cmake')
source=("https://download.fcitx-im.org/fcitx-chewing/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('3492ad6ecaf00bb1ea07b76c9c23da075615597c1a68434a2da003cbe410d12172510d4306379777a1d04a359b017c49d278c002a7230b030693b668b6030bfd'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
