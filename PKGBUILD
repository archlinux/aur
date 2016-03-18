# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch
pkgver=0.6
pkgrel=1
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/${pkgname}"
license=('GPL')
groups=('xde')
depends=('desktop-file-utils' 'gtk2' 'libnotify' 'startup-notification')
optdepends=('dmenu: to use dmenu_launch script')
makedepends=('pkgconfig')
install="${pkgname}.install"
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('72045c0b53e7886df356d75509e2b2df')

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
