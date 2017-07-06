# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

_pkgname=librime
pkgname=$_pkgname-git
pkgver=1.2.9.r209.g939893c0
pkgrel=1
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'google-glog' 'marisa')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost' 'git' 'gtest')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/rime/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^rime-//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
