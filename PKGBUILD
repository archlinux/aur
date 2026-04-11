# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.1.1"
pkgrel=1
pkgdesc="A NES emulator written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
depends=('sdl2-compat' 'libinih')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dccfe56c065b2b6e941d92cf00d001fa7e0b700e7075a15f1a017a3a616dc472')
sourcedir="${pkgname}-${pkgver}"

build() {
  make --directory="${sourcedir}"
}

package() {
  make --directory="${sourcedir}" DESTDIR="${pkgdir}" PREFIX=/usr install
}
