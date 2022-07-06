# Maintainer: madprops <mprops at protonmail dot com>

pkgname="symview-git"
pkgdesc="Find files and create symlinks"
pkgver=r32.06c6e6c
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/symview"
license=("GPL3")
depends=("rofi")
makedepends=("git")
sha256sums=("SKIP")
source=("$pkgname::git+https://github.com/madprops/symview.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd symview-git
  install -D -m755 symview.py "$pkgdir/usr/bin/symview"
}
