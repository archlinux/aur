# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.2
pkgrel=3
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost-libs' 'google-glog' 'kyotocabinet' 'opencc' 'yaml-cpp' 'marisa')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost')
source=("https://github.com/lotem/librime/archive/rime-$pkgver.tar.gz")
sha512sums=('98fe4d0d0429eb027c1846b8be9866c207b8050526d5b8e0b85ab93a8d45bee65cbbf6b28302f1b79f0044a4a7f17e27e3b2300c3ebb6b1b58c7c34220f7e229')

build() {
  cd $pkgname-rime-$pkgver
  make
}

package() {
  cd $pkgname-rime-$pkgver
  make DESTDIR="$pkgdir" install
}

