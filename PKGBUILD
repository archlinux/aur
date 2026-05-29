# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.4.1"
pkgrel=2
pkgdesc="A NES emulator written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson')
depends=('sdl2-compat' 'libinih')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6e76d21b2b30e645e98636396cb9bf4cb073ab5f282fceea91fa10bce963b1fd')
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
