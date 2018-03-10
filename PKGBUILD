# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.3.0
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
sha512sums=('08bf47d04d9bb8c9112ba27921be693b76ef608b5b783c79fe592694d29868f282c202a43e920033cdb95a7844caf7b232d4d990267ecd489709b2fbebf01cef')

build() {
  cd $pkgname-rime-$pkgver
  make
}

package() {
  cd $pkgname-rime-$pkgver
  make DESTDIR="$pkgdir" install
}
