# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lptk
pkgver=0.4.0
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/lptk'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
source=("${pkgname}::git+https://gitlab.com/ogarcia/${pkgname}.git#tag=${pkgver}")
b2sums=('7685cd00d8a440e545cf867a4ad9761ea5e8c3962ec9ee387b43b877e0323dc50c66df314063b4cd227c889bcd204971bb4bcf5e6423841371b592b5f1e0496b')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
