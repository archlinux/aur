# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rotor
pkgver=0.11.0
pkgrel=1
pkgdesc='Stateless password manager'
arch=('aarch64' 'x86_64')
url='https://gitlab.com/ogarcia/rotor'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('git' 'meson' 'rust')
options=('!lto')
conflicts=('lptk')
replaces=('lptk')
source=("${pkgname}::git+https://gitlab.com/ogarcia/${pkgname}.git#tag=${pkgver}")
b2sums=('d20bdfbf65514efa97bc41ea6099e53a43cbf29c604370dd9d51735631c89640ff1423364c9316176b5c9ff07f78511966a1d528bcd521d6f7c84a51756fb685')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
