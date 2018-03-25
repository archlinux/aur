# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch
pkgver=1.6
pkgrel=1
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/${pkgname}"
license=('GPL')
groups=('xde')
depends=('glib2' 'libxinerama' 'libxrandr')
optdepends=('dmenu: to use dmenu_launch script')
makedepends=('pkgconfig')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('586378d863165332eae88777b820ce36')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
