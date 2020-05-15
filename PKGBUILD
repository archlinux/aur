# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

_pkgname=xswitcher
pkgname=xswitcher-git
pkgver=r6.4bd85fc
pkgrel=1
pkgdesc="quick script to fiddle with xorg.conf when using an eGPU"
arch=(x86_64)
url="https://github.com/felixonmars/xswitcher"
license=('GPL')
makedepends=('git')
depends=('xorg-server' 'nvidia')
source=("git+https://github.com/felixonmars/xswitcher")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 xswitcher -t "$pkgdir"/usr/bin/xswitcher
  install -Dm644 xswitcher.service -t "$pkgdir"/usr/lib/systemd/system/xswitcher.service
}
