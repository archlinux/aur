# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=kanttiinit-git
dest=cli
pkgver=v0.0.3.r13.g7600b66
pkgrel=2
pkgdesc="Command-line interface for Kanttiinit, a Finnish student restaurant menu tool (git)"
arch=("any")
url="https://github.com/Kanttiinit/cli"
depends=("curl")
makedepends=("gcc" "make" "git")
source=("git+$url")
sha512sums=("SKIP")

build() {
  cd $dest
  make
}

pkgver() {
  cd $dest
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
  cd $dest
  install -D kanttiinit -t "$pkgdir"/usr/bin
}
