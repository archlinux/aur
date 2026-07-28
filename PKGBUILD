# Maintainer: spiriwind <ruiting_mail@qq.com>
pkgname=quickemu-tui-git
pkgrel=1
pkgdesc="TUI/CLI manager for quickemu virtual machines (git version)"
arch=('x86_64')
url="https://gitee.com/tqblyc/quickemu-tui"
license=('MIT')
depends=('python' 'quickemu')
makedepends=('git')
options=('!strip')
source=("git+https://gitee.com/tqblyc/quickemu-tui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 quickemu-tui.py "$pkgdir/usr/bin/quickemu-tui"
}
