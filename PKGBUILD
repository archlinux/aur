# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-terminal
pkgver=0.2.0.20200620
_commit=1c179a463a22a5a6a04e68c01eceaa5b8d89070e
pkgrel=1
pkgdesc="Terminal for Liri"
arch=("x86_64")
url="https://github.com/lirios/terminal"
license=("GPL")
depends=('fluid' 'qt5-gsettings')
makedepends=('cmake' 'liri-cmake-shared' 'ninja' 'qt5-tools')
replaces=('papyros-terminal')
source=("https://github.com/lirios/terminal/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('d03baa12bc169a95eb9e60348d421d435ab8d48a805720e6cfdff46fd218a6dc')

build() {
  cd terminal-$_commit
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd terminal-$_commit
  DESTDIR="$pkgdir" ninja install
}
