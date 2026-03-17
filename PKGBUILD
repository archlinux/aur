# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sitra
pkgver=0.1.1
pkgrel=1
pkgdesc='Install fonts on your system'
arch=('aarch64' 'x86_64')
url='https://github.com/sitraorg/sitra'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libsitra' 'gtksourceview5' 'webkitgtk-6.0')
makedepends=('blueprint-compiler' 'git' 'meson' 'vala')
source=("${pkgname}::git+https://github.com/sitraorg/${pkgname}.git#tag=v${pkgver}")
b2sums=('24f4ba99fbf22bc54f20fbb9ef3db3e24d3ebf8ab10b6bc6255088b691679689f7c0e4c75a6d7c8b6dfc17dfa8d466f7b2cfcb6357ab5da24475cc6833443165')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
