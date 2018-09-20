# Maintainer: Andrea Orru <andrea@orru.io>

pkgname=tmux-current-pane-hostname-git
pkgver=r10.845660a
pkgrel=1
pkgdesc="Tmux plugin that enables displaying hostname and user of the current pane in your status bar"
arch=("x86_64")
url="https://github.com/soyuka/tmux-current-pane-hostname"
license=("MIT")
depends=("tmux")
install="$pkgname.install"
source=("$pkgname::git+https://github.com/soyuka/tmux-current-pane-hostname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -dm755 "$pkgdir/usr/share/tmux/scripts"
  install -m755 scripts/*.sh "$pkgdir/usr/share/tmux/scripts/"
  install -m755 current_pane_hostname.tmux "$pkgdir/usr/share/tmux/"
}
