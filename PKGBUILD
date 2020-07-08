# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-files
pkgver=0.2.0.20200620
_commit=7582252b229d71f896936deee9165a38ad468461
pkgrel=1
pkgdesc="The file manager for Liri"
arch=("x86_64")
url="https://github.com/lirios/files"
license=("GPL")
depends=('fluid' 'taglib')
makedepends=('cmake' 'liri-cmake-shared' 'ninja' 'qt5-tools')
replaces=('papyros-files')
source=("https://github.com/lirios/files/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('6dfa6f4ce85863cb764d5ea251623700dd797db61ebfa09e81eda22eee1deee8')

build() {
  cd files-$_commit
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd files-$_commit
  DESTDIR="$pkgdir" ninja install
}
