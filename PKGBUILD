# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.6"
pkgrel=1
pkgdesc="A NES emulator written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson')
depends=('sdl2-compat' 'libinih')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3f43b4d79b87e2ac6b604189a12459076d8335ea7302744b942e6ba594a44a9d')
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
