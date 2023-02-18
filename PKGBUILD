# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
pkgname=paleta
pkgver=0.23
pkgrel=2
pkgdesc="Extract the dominant colors from any image."
arch=('any')
url="https://github.com/nate-xyz/paleta"
license=('GPL3')
depends=('libadwaita' 'python-colorthief' 'python-pillow' 'python-pyxdg')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
_commit=cef94f4f54fd19652c727749d0fd8b3b0e88f055  # 0.2.3
source=("git+https://github.com/nate-xyz/paleta.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package () {
  meson install -C build --destdir "$pkgdir"
}
