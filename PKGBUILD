# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=pigoune
pkgver=2.5.0
pkgrel=1
pkgdesc='All your graphic assets, organized and within reach'
arch=('aarch64' 'x86_64')
url='https://github.com/Gor3pig/Pigoune'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust')
options=('!lto')
source=("${pkgname}::git+https://github.com/Gor3pig/${pkgname}.git#tag=v${pkgver}")
b2sums=('bbb245dec8757041f400545c1f37dcd9977f7925d0aef4e92db1919dd0deede46d661c2115576d8d2211503544d71180041aadf900c8a4811c1306eed590c17f')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}
