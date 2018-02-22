# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.2.10
pkgrel=1
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'google-glog' 'marisa')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rime/librime/archive/rime-$pkgver.tar.gz")
sha512sums=('b4a0f21f43945205aabcda7af883965d2a09035700ad43d5491d7feb144d9b9e584fdf92476544eb90eb43baaaa42447bd5d42568e86f584f1be92f328c03cc8')

build() {
  cd $pkgname-rime-$pkgver
  make
}

package() {
  cd $pkgname-rime-$pkgver
  make DESTDIR="$pkgdir" install
}
