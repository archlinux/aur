# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=fcitx-cloudpinyin
pkgver=0.3.6
pkgrel=2
pkgdesc='Standalone module for fcitx that uses pinyin API on the internet to provide additional input candidates'
arch=('x86_64')
url="https://github.com/fcitx/fcitx-cloudpinyin"
license=('GPL')
depends=('curl' 'fcitx')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('d3a05fc48659db64a0a827c9b75cfb8b33f7cdb48bd936a2ba33f49469e29558a7da0f58cb7e6929b1265d451d23b0a37d87b7b69752599656c94049077d9914'
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
