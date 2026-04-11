# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.1"
pkgrel=1
pkgdesc="A NES emulator written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
depends=('sdl2-compat' 'libinih')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('84d2751736813907176e06eccbc04ef0530c23940e8f5ae1f55f9807b8cb5b28')
sourcedir="${pkgname}-${pkgver}"

build() {
  make --directory="${sourcedir}"
}

package() {
  make --directory="${sourcedir}" DESTDIR="${pkgdir}" PREFIX=/usr install
}
