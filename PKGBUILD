# Maintainer: Alucryd <alucryd at gmail dot com>

pkgname=systemd-user-session-units-git
pkgver=58
pkgrel=1
pkgdesc="A collection of units for the systemd user session."
arch=('any')
url="https://github.com/sofar/user-session-units"
license=('GPL3')
depends=('dbus' 'systemd-xorg-launch-helper-git')
makedepends=('git')
provides=('user-session-units')
conflicts=('user-session-units')
source=('user-session-units::git+https://github.com/sofar/user-session-units.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/user-session-units

  git rev-list --count HEAD
}

build () {
  cd "${srcdir}"/user-session-units

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/user-session-units

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
