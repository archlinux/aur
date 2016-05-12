# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.2.20160226
_commit=df4192cc0980b21bc45f4eb142ba24cfa78a50e0
pkgrel=2
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
