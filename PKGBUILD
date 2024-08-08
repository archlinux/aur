# Maintainer: Brandon <bmcomis2018@gmail.com>

pkgname=todoist-dailies
pkgver=0.0.1
pkgrel=1
pkgdesc="Receive a daily popup to notify about upcoming Todoist tasks"
arch=(any)
url="https://github.com/SSS-Says-Snek/todoist-dailies"
license=("MIT")
depends=(
  'python-gobject'
  'libadwaita'
  'python-todoist-api-python'
)
makedepends=(
  'git'
  'meson'
)
source=("git+https://github.com/SSS-Says-Snek/todoist-dailies.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  meson setup --prefix=/usr --buildtype=plain "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
