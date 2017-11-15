# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=fcitx-cloudpinyin
pkgver=0.3.5
pkgrel=1
pkgdesc='Standalone module for fcitx that uses pinyin API on the internet to provide additional input candidates'
arch=('x86_64')
url="https://github.com/fcitx/fcitx-cloudpinyin"
license=('GPL')
depends=('curl' 'fcitx')
makedepends=('cmake')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

sha512sums=('b56cde4955fab02d204cfe937b46aeb5b6adf9e4eb4fead6e7b8e0b5cd1ebce06a0de3f9d477a1cb58eb077655f17975b7e13951074d1766b283b86eeb5b276e')
