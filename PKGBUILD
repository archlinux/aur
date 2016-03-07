# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Mike Dacre <mike@dacre.me>

pkgname=tmux-cssh-git
pkgver=1.0.6.0.r7.g2175073
pkgrel=1
pkgdesc="TMUX with a \"ClusterSSH\"-like behaviour"
arch=('any')
url="https://github.com/dennishafemann/tmux-cssh"
license=('Apache')
depends=('tmux')
makedepends=('git')
source=('git+https://github.com/dennishafemann/tmux-cssh.git')
md5sums=('SKIP')

pkgver() {
  cd tmux-cssh

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd tmux-cssh

  install -Dm755 tmux-cssh "$pkgdir"/usr/bin/tmux-cssh
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/tmux-cssh/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/tmux-cssh/README
}
