# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-scan-bzr
pkgver=r607
pkgrel=1
pkgdesc='Simple Scanning Utility'
arch=('i686' 'x86_64')
url='https://launchpad.net/elementary-scan'
license=('GPL2')
depends=('granite-bzr' 'launchpad-integration-gtk3' 'libgee06' 'sane' 'scour')
makedepends=('bzr' 'gnome-common' 'intltool' 'vala')
provides=("${pkgname%-*}" 'simple-scan')
conflicts=("${pkgname%-*}" 'simple-scan')
install="${pkgname%-*}.install"
source=('bzr+lp:elementary-scan')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}

  ./autogen.sh --prefix='/usr'
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
