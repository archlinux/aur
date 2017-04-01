# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-terminal
pkgver=0.0.0.20170213
_commit=62acaf9f943e1cdf1b57c87eb8ca2abd1d24a75d
pkgrel=1
pkgdesc="Terminal for Liri"
arch=("i686" "x86_64")
url="https://github.com/lirios/terminal"
license=("GPL")
depends=("fluid" "vibe" "dconf")
makedepends=("extra-cmake-modules")
replaces=('papyros-terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/terminal/archive/$_commit.tar.gz")
sha256sums=('90e2d52a7d54020bf97cca284eb36fb0b38ce5ea56aee4b6f966bd686f01af21')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir"/terminal-$_commit -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
