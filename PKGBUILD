# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lock
pkgver=1.8.2
pkgrel=1
pkgdesc='Process data with GnuPG 🔒'
arch=('x86_64')
url='https://konstantintutsch.com/Lock/'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://github.com/konstantintutsch/Lock.git#tag=v${pkgver}")
b2sums=('2d29694cdb07c87204cc99a0ee309fe6b3d34fadd993bbc4a2dd25c0a7be1cc10bc95d8cc54eb2e97decc6360893dd1d774f18670dac9e56a5c744086224f7ef')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
