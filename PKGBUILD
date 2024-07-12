# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=tactics
pkgver=0.8
_commit=74e9e287f85e692ea52b28f0fc7ff3c2ef5cbc07
pkgrel=1
pkgdesc="Build your soccer lineup"
url="https://gitlab.com/leesonwai/tactics"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('libadwaita')
makedepends=('git' 'glib2-devel' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
