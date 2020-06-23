# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-geany-git
pkgver=r26.f03782f
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/editorconfig-geany"
license=('GPL')
depends=('geany' 'editorconfig-core-c')
makedepends=('git')
provides=('editorconfig-geany')
conflicts=('editorconfig-geany')
source=('git+https://github.com/editorconfig/editorconfig-geany.git')
sha256sums=('SKIP')


pkgver() {
  cd "editorconfig-geany"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "editorconfig-geany"

  make EDITORCONFIG_PREFIX="/usr"
}

package() {
  cd "editorconfig-geany"

  install -Dm644 "editorconfig-geany.so" -t "$pkgdir/usr/lib/geany"
}
