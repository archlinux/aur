# Maintainer: insaneshadowzaman <insaneshadowzaman@gmail.com>
# Thanks to: sonichy <sonichy@163.com>

pkgname=deepin-dock-plugin-cmdu-english-git
pkgver=r18.18299e8
pkgrel=1
pkgdesc="Deep Linux system speed taskbar plug-in, mouse hover display boot time, CPU usage, memory usage, download bytes, upload bytes."
arch=('x86_64')
url="https://github.com/insaneshadowzaman/CMDU_DDE_DOCK"
depends=('deepin-dock')
makedepends=('git')
source=("git+https://github.com/insaneshadowzaman/CMDU_DDE_DOCK.git")
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

