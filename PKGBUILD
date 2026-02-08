# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sitra
pkgver=0.1.0
pkgrel=1
pkgdesc='Install fonts on your system'
arch=('aarch64' 'x86_64')
url='https://github.com/sitraorg/sitra'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libsitra' 'gtksourceview5' 'webkitgtk-6.0')
makedepends=('blueprint-compiler' 'git' 'meson' 'vala')
source=("${pkgname}::git+https://github.com/sitraorg/${pkgname}.git#tag=v${pkgver}")
b2sums=('fbc5e92124afb29d6620ad441ba07c99e0cced701f840dbaddd2eb933979e819f0a97166320b12b782d859f0d8fd6d3d041e90237043e4ef0b25cd50998e7dc0')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
