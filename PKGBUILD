# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-videoplayer-git
_pkgname=piscesde-videoplayer
pkgver=0.9
pkgrel=1
pkgdesc="Cirily Video Player"
arch=('x86_64')
url="https://github.com/piscesys/videoplayer"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'libpiscesde-git' 'mpv' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd videoplayer
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd videoplayer

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd videoplayer
  make DESTDIR="$pkgdir" install
}
