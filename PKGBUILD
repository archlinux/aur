# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="akwaita-theme"
pkgname="akwaita-theme-git"
pkgver=0.1.0.r7.g5c7318d
pkgrel=1
pkgdesc="A simple gnome-shell theme base on Adwaita"
arch=("any")
makedepends=("sassc" "git")
url="https://github.com/akiirui/akwaita-theme/"
license=("GPL2")
source=("git+https://github.com/akiirui/akwaita-theme.git")
b2sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$_pkgname"
  make build
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" package
}
