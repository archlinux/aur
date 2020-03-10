# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-text
pkgver=0.5.0
pkgrel=1
pkgdesc='Material Design text editor'
arch=('x86_64')
url='https://github.com/lirios/text'
license=('GPL')
depends=('fluid')
makedepends=('liri-cmake-shared' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/text/archive/v$pkgver.tar.gz")
sha512sums=('a4c374ce79b06fea312e407a9062217be1eec42851a7cdb1a5ea927d7164c33fd9310fcf750f70dc1637b5c8b9b2037327742b32f6c26c58c15bc89b482454d9')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../text-$pkgver
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
