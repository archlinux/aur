# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rotor
pkgver=0.10.1
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/rotor'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
options=('!lto')
conflicts=('lptk')
replaces=('lptk')
source=("${pkgname}::git+https://gitlab.com/ogarcia/${pkgname}.git#tag=${pkgver}")
b2sums=('b0d398b230b8b28dcc9580fc956845c42acfc3d16deb434eef7bbbbde203e19e2127b7d60bb6fad37e4e9fa3ed0161ab44e2771280729cce5bc1968391b694c4')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
