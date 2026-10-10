# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sitra
pkgver=0.2.0
pkgrel=1
pkgdesc='Install fonts on your system'
arch=('aarch64' 'x86_64')
url='https://github.com/sitraorg/sitra'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libsitra' 'gtksourceview5' 'webkitgtk-6.0')
makedepends=('blueprint-compiler' 'git' 'meson' 'vala')
source=("${pkgname}::git+https://github.com/sitraorg/${pkgname}.git#tag=v${pkgver}")
b2sums=('553b2a9bef4f20f1c78b0478cb6e7eed1c767a0c1a3baf5480c0ed0b8462546d6387c4c666073e1a5a104f857f43dfc26e888a9a6642b2dee3bbbf4f937832fb')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
