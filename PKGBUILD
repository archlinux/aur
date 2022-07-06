# Maintainer: madprops <mprops at protonmail dot com>

pkgname="ezkl-git"
pkgdesc="Remember and jump to paths in your shell"
pkgver=r232.737bac6
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/ezkl"
license=("Boost")
depends=("rofi")
makedepends=("git")
sha256sums=("SKIP")
source=("$pkgname::git+https://github.com/madprops/ezkl.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ezkl-git
  install -D -m755 ezkl.py "$pkgdir/usr/bin/ezkl"
}
