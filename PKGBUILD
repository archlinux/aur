# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDG sound theme for the unexicon distribution"
pkgname=unexicon-sound-theme
pkgver=1.0
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/bbidulock/${_pkgname}"
groups=('unexicon')
depends=('sound-theme-freedesktop' 'sound-theme-smooth' 'linux-a11y-sound-theme')
makedepends=('git' 'pkgconfig' 'flite' 'flite-voices' 'sox')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('0d9d3f72dd27e2da7a2cf47ddf4f100882102e0aeb55bfce16b132de4814c115')

build() {
  cd ${pkgname}-${pkgver}
  ./configure
  make
}

package() {
  make -C ${pkgname}-${pkgver} DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
