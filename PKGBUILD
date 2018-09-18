# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.3.1
pkgrel=3
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'google-glog' 'marisa')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rime/librime/archive/rime-$pkgver.tar.gz")
sha512sums=('7df91eea6715312c564a739edd85e89b4abdc0493d9727304595897f1b8637fc07b71077b818cac4ebd75b864759c711c12f826a6d7fe52caad88cc72b5640cf')

build() {
  cd $pkgname-rime-$pkgver
  make
}

package() {
  cd $pkgname-rime-$pkgver
  make DESTDIR="$pkgdir" install
}
