# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesys-videoplayer-git
_pkgname=piscesys-videoplayer
pkgver=0.9
pkgrel=1
pkgdesc="An open source video player built with Qt/QML and libmpv"
arch=('x86_64')
url="https://gitlab.com/piscesys/videoplayer"
license=('GPL')
depends=('piscesys-fishui-git' 'libpiscesys-git' 'mpv' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-videoplayer-git")
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
