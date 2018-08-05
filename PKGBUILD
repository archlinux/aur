# Maintainer: chenjunyu19 <1335546814@qq.com>

pkgname=deepin-dock-plugin-cmdu-git
pkgver=r18.5440386
pkgrel=1
pkgdesc="A plugin for deepin dock, display uptime, CPU usage, RAM usage and netspeed."
arch=('x86_64')
url="https://github.com/sonichy/CMDU_DDE_DOCK"
depends=('deepin-dock')
makedepends=('git')
source=("git+https://github.com/sonichy/CMDU_DDE_DOCK.git")
md5sums=('SKIP')
_gitname=CMDU_DDE_DOCK

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/$_gitname"
  install -Dm755 libCMDU.so "$pkgdir/usr/lib/dde-dock/plugins/libCMDU.so"
}
