# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname=emeus
pkgname=$_pkgname
pkgver=1.0
pkgrel=1
pkgdesc="Constraint-based layout manager for GTK+"
url="https://ebassi.github.io/emeus"
arch=(any)
license=(GPL)
depends=(gtk3)
makedepends=(meson)
groups=(gnome)
source=("git+https://github.com/ebassi/emeus")
sha256sums=('SKIP')

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}
