# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.4.0
pkgrel=1
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'google-glog' 'marisa')
optdepends=('plum: preset input schemas'
            'plum-extra: extra input schemas')
makedepends=('cmake' 'boost' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rime/librime/archive/$pkgver.tar.gz")
sha512sums=('da68983638c6f25d994060a607f2ccab8917a71dbf10b9c6f1140c87c9ef4124e29a1d0ef16bbd0edc9a3a22bd5845aa894888d678607db372750f300638f562')

build() {
  cd $pkgname-$pkgver
  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
