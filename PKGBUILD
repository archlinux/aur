# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-wallpapers-git
_pkgname=piscesys-wallpapers
pkgver=0.9
pkgrel=1
pkgdesc="piscesys's system wallpaper"
arch=('any')
url="https://gitlab.com/piscesys/wallpapers"
license=('GPL')
depends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('cmake' 'git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd wallpapers
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd wallpapers

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd wallpapers
  DESTDIR="$pkgdir" make install
}
