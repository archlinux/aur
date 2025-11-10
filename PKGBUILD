# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rotor
pkgver=0.10.0
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/rotor'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
conflicts=('lptk')
replaces=('lptk')
source=("${pkgname}::git+https://gitlab.com/ogarcia/${pkgname}.git#tag=${pkgver}")
b2sums=('31a123bd06e67ee83dcf2b200f4972e682bd236d4a6a26fbc8f1430cc63156e60f81a516cecd322172fe48ca3f7d86936b9b46d1e9c53d5bcf61e4d6dc4b1ca8')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
