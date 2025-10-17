# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lptk
pkgver=0.9.0
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/lptk'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
source=("${pkgname}::git+https://gitlab.com/ogarcia/${pkgname}.git#tag=${pkgver}")
b2sums=('68f3d55ff1e4701c3433c0219ed3baf156b26d5ddaceb7fb1b7c1db3ed7b9881a2ad2e5609b0c2e65156c05c8bf88e6386100b11975a724b82c5f7e1e28248f3')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
