# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.5.1"
pkgrel=1
pkgdesc="A NES emulator written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson')
depends=('sdl2-compat' 'libinih')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('71953b456a90b1e29534896bc69d6ec1a4ff5f5b81df9aad2ac3ccf634c2d642')
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
