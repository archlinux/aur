# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lock
pkgver=1.9.0
pkgrel=1
pkgdesc='Process data with GnuPG 🔒'
arch=('x86_64')
url='https://konstantintutsch.com/Lock/'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/konstantintutsch/Lock.git#tag=v${pkgver}")
b2sums=('205ab88a1c8b8c8728c222cc25b10311ad4fc14e5daffe51863ad7bdeab166732b164840a220e1f54475d2fda32e469f2d347325bf5cff21b04373b0d545737a')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
