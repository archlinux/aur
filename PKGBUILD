# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.3.2
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
sha512sums=('c646b6c801798fcc000a5d08afc7f53498a108929f67dd1a1db98e5377c0e2e3339e3851f100c641287ba84d2d2dc20acfa9033d12df7b164534d8a160558a77')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
