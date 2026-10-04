# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=pigoune
pkgver=1.3.0
pkgrel=1
pkgdesc='All your graphic assets, organized and within reach'
arch=('aarch64' 'x86_64')
url='https://github.com/Gor3pig/Pigoune'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust')
options=('!lto')
source=("${pkgname}::git+https://github.com/Gor3pig/${pkgname}.git#tag=v${pkgver}")
b2sums=('bd6dc824c08b67c0240eb5a3ed66d332689ef107b10d23dc8910d37a43adfe5be5394b6ac87ae9e7c5e688f1887c41a078a6dc4baed434d515f596ef0dfd49a3')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}
