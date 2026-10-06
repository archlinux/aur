# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=pigoune
pkgver=2.1.0
pkgrel=1
pkgdesc='All your graphic assets, organized and within reach'
arch=('aarch64' 'x86_64')
url='https://github.com/Gor3pig/Pigoune'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust')
options=('!lto')
source=("${pkgname}::git+https://github.com/Gor3pig/${pkgname}.git#tag=v${pkgver}")
b2sums=('e2d2d6b636ba99408bc6ff4e5898a19884eb1f67a4a930bb432c32da9c697ca0e7bac751defcbb7b6d7f10af48f9758167304640f3aa25ebd5724f2744288424')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}
