# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch
pkgver=1.10
pkgrel=1
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/${pkgname}"
license=('GPL')
groups=('xde')
depends=('glib2' 'libxrandr' 'libxinerama' 'desktop-file-utils')
optdepends=('dmenu: to use dmenu_launch script')
makedepends=('pkgconfig')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('9d76dc65a41f2210c464825ffc3fe4066d5be313d71e843de0121abb7463df4b')

build() {
  cd ${pkgname}-${pkgver}
  ./configure
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
