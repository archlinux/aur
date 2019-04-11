# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Mike Dacre <mike@dacre.me>

pkgname=tmux-cssh
pkgver=r76.48c9ed8
pkgrel=1
epoch=1
pkgdesc="TMUX with a \"ClusterSSH\"-like behaviour"
arch=('any')
url="https://github.com/zinic/tmux-cssh"
license=('Apache')
depends=('tmux')
makedepends=('git')
source=(git+https://github.com/zinic/tmux-cssh.git#commit=48c9ed8)
md5sums=('SKIP')

pkgver() {
  cd tmux-cssh

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd tmux-cssh

  install -Dm755 tmux-cssh "$pkgdir"/usr/bin/tmux-cssh
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/tmux-cssh/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/tmux-cssh/README
}
