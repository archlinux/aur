# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rotor
pkgver=0.11.1
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
b2sums=('6009b161dd4cd19d52a612a9448f9e5009907edddd9c2ddf17f3c1cad4868563d235a343da966149542486d9bffa57c267f31563cef36e59d4a2af5a08599e9b')

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
