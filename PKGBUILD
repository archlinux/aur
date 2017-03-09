# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-geany-git
pkgver=r18.9dce3bb
pkgrel=1
pkgdesc='EditorConfig plugin for Geany'
url='https://github.com/editorconfig/editorconfig-geany'
arch=('i686' 'x86_64')
license=('GPL')
depends=('geany' 'editorconfig-core-c')
makedepends=('git')
source=('git+https://github.com/editorconfig/editorconfig-geany.git')
sha256sums=('SKIP')


pkgver() {
  cd "editorconfig-geany"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "editorconfig-geany"

  make EDITORCONFIG_PREFIX=/usr
}

package() {
  cd "editorconfig-geany"

  install -Dm644 "editorconfig-geany.so" "$pkgdir/usr/lib/geany/editorconfig-geany.so"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/editorconfig-geany/COPYING"
}
