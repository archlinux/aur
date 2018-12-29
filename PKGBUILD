# Maintainer: chenjunyu19 <1335546814@qq.com>

pkgname=deepin-dock-plugin-cmdu-git
pkgver=r25.bad1eb3
pkgrel=1
pkgdesc="A plugin for deepin dock, display uptime, CPU usage, RAM usage and netspeed."
arch=('x86_64')
url="https://github.com/sonichy/CMDU_DDE_DOCK"
depends=('deepin-dock')
makedepends=('git' 'qt5-base')
source=("git+https://github.com/sonichy/CMDU_DDE_DOCK.git")
md5sums=('SKIP')
_gitname=CMDU_DDE_DOCK

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  qmake "$srcdir/$_gitname"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir/usr" install
}
