# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lptk
pkgver=0.2.0
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/lptk'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
source=("${pkgname}::git+https://gitlab.com/ogarcia/lptk.git#tag=${pkgver}")
b2sums=('4436bffc792cd2c48ecf073d9cf6de2e81ce359a6b591167a697443a7bcb5a13ef15bf2ce2fb1a267be2fe7f962b2ff5eadefa47dcf745d3dded3f19c2b49ee7')

build() {
  mkdir -p "${srcdir}"/output
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
