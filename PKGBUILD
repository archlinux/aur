# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=pigoune
pkgver=2.0.0
pkgrel=1
pkgdesc='All your graphic assets, organized and within reach'
arch=('aarch64' 'x86_64')
url='https://github.com/Gor3pig/Pigoune'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust')
options=('!lto')
source=("${pkgname}::git+https://github.com/Gor3pig/${pkgname}.git#tag=v${pkgver}")
b2sums=('e8073f6786afc7778984752d5d20ce29c56fa477a8539fb38cb1d9c78be6e9fb02a58e3961fb9b64a396ff51bf5cab4977583c9249bbf115bf9ce4ebe08f246f')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}
