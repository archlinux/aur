# Maintainer: Jonathan Neidel <aur@jneidel.com>

pkgname=shell-velocity-git
pkgver=r55.849e2f2
pkgrel=1
pkgdesc="A portable notational velocity for your shell"
arch=(any)
url="https://github.com/saccarosium/shell-velocity"
license=(MIT)
depends=()
makedepends=(git)
optdepends=(
  'fzf: default picker'
  'fzy: alternative picker'
  'peco: alternative picker'
  'gum: alternative picker'
  'dmenu: alternative picker'
  'rofi: alternative picker'
)
provides=(shv)
conflicts=()
source=("git+https://github.com/saccarosium/shell-velocity.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname/-git/}"

  install -Dm755 shv "$pkgdir/usr/bin/shv"
}
