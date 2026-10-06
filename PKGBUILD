# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=pigoune
pkgver=2.2.0
pkgrel=1
pkgdesc='All your graphic assets, organized and within reach'
arch=('aarch64' 'x86_64')
url='https://github.com/Gor3pig/Pigoune'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust')
options=('!lto')
source=("${pkgname}::git+https://github.com/Gor3pig/${pkgname}.git#tag=v${pkgver}")
b2sums=('db410a7b9f606415ca4c68575287af106a71eb05ee213e05819e193a1cf605baa9243c7b59057ad0bfe575b0d8d9540a1c1b813e00c9ecf831718a8ba821d630')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}
