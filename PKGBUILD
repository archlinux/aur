# Maintainer: Narthana Epa (triarius) <narthana.epa@gmail.com>
# Contributor: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

_pkgname=paruz
pkgname=paruz-git
pkgver=r26.e7aaf49
pkgrel=2
pkgdesc="A fzf terminal UI for paru or pacman"
arch=("any")
url="https://github.com/joehillen/paruz"
license=("UNLICENSE")
depends=("bash" "fzf")
makedepends=("git")
conflicts=("paruz")
provides=("paruz")
optdepends=("paru: for AUR support")
source=("git+https://github.com/joehillen/paruz.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm775 "$srcdir/$_pkgname/paruz" "$pkgdir/usr/bin/paruz"
}
