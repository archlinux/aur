# Maintainer: chenjunyu19 <1335546814@qq.com>

pkgname=deepin-dock-plugin-cmdu-git
pkgver=r16.b3fa205
pkgrel=1
pkgdesc="深度Linux系统网速任务栏插件，鼠标悬浮显示开机时间、CPU使用率、内存使用率、下载字节、上传字节。"
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
