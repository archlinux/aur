# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=fcitx-cloudpinyin
pkgver=0.3.6
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

sha512sums=('d3a05fc48659db64a0a827c9b75cfb8b33f7cdb48bd936a2ba33f49469e29558a7da0f58cb7e6929b1265d451d23b0a37d87b7b69752599656c94049077d9914')
