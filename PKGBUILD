# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-scan-bzr
pkgver=607
pkgrel=1
pkgdesc='Simple Scanning Utility'
arch=('i686' 'x86_64')
url='https://launchpad.net/elementary-scan'
license=('GPL2')
depends=('launchpad-integration-gtk3' 'libgee' 'sane' 'scour'
         'libgranite.so')
makedepends=('bzr' 'gnome-common' 'intltool' 'vala')
provides=('elementary-scan' 'simple-scan')
conflicts=('elementary-scan' 'simple-scan')
install='elementary-scan.install'
source=('bzr+lp:elementary-scan')
sha256sums=('SKIP')

pkgver() {
  cd elementary-scan

  bzr revno
}

build() {
  cd elementary-scan

  ./autogen.sh \
    --prefix='/usr'
  make
}

package() {
  cd elementary-scan

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
