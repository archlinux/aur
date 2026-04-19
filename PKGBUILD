# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.2"
pkgrel=1
pkgdesc="A NES emulator written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson')
depends=('sdl2-compat' 'libinih')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9f44ec4c005d511f65e175b9ae097a7f97d1baf9f0f6c87751ad0d997cbdc1f8')
sourcedir="${pkgname}-${pkgver}"

build() {
  cd "${sourcedir}"

  meson setup build
  meson compile -C build
}

package() {
  cd "${sourcedir}"

  meson compile legacy_install -C build
  cp -r install/* "${pkgdir}"
}
