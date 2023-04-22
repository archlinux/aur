# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-core-git
_pkgname=piscesys-core
pkgver=0.9
pkgrel=1
pkgdesc="System components and backend of Piscesys"
arch=('x86_64')
url="https://gitlab.com/piscesys/core"
license=('GPL')
depends=('piscesys-fishui-git' 'libpiscesys-git' 'qt5-quickcontrols2' 'libpulse' 'libxcursor' 'libxtst'
          'polkit-qt5')
makedepends=('extra-cmake-modules' 'qt5-tools'  'xf86-input-libinput'
              'xf86-input-synaptics' 'xorg-server-devel' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-core-git")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd core

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core
  make DESTDIR="$pkgdir" install
}
