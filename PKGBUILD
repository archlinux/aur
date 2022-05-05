#!/hint/bash -e
# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Alif <alive4ever at live dot com>

pkgname=tmux-bash-completion-git
pkgver=r16.f5d5323
pkgrel=2
pkgdesc="Bash completion for tmux"
arch=('any')
url="https://github.com/imomaliev/tmux-bash-completion"
license=('GPL2')
depends=('bash-completion' 'tmux')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions/" completions/*
}
