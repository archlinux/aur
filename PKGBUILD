# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lptk
pkgver=0.8.0
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/lptk'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
source=("${pkgname}::git+https://gitlab.com/ogarcia/${pkgname}.git#tag=${pkgver}")
b2sums=('8d30711a6eac2fc89a60408df3224bbb5070164a4c1c7e17d47eff75bcbeab390fb4b863326f8c04add28032c1ee51d3a10abb188f15b2abf4f6b65a6004e531')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
