# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.2.20151020
_commit=4734375c32a790f469f432838e5d507129739ea4
pkgrel=1
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'google-glog' 'marisa')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost' 'git')
source=("git+https://github.com/rime/librime.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
