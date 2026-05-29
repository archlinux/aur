# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.4.1"
pkgrel=1
pkgdesc="A NES emulator written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson')
depends=('sdl2-compat' 'libinih')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9c49f324767fb01861f6c145c68ff7781a01b002a00de36d98f16c80c7b168c4')
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
