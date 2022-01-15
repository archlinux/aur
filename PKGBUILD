# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-videoplayer-git
_pkgname=cutefish-videoplayer
pkgver=0.5.r0.gc121801
pkgrel=1
pkgdesc="An open source video player built with Qt/QML and libmpv"
arch=('x86_64')
url="https://github.com/cutefishos/videoplayer"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git' 'mpv' 'qt5-quickcontrols2')
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
