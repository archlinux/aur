# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=gala-bzr
pkgver=r475
pkgrel=1
pkgdesc='The Pantheon Window Manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/gala'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'mutter' 'plank'
         'libgranite.so')
makedepends=('bzr' 'gnome-common' 'granite-bzr' 'intltool' 'vala')
provides=('gala' 'libgala.so')
conflicts=('gala')
install='gala.install'
source=('bzr+lp:gala')
sha256sums=('SKIP')

pkgver() {
  cd gala

  echo "r$(bzr revno)"
}

build() {
  cd gala

  ./autogen.sh \
    --prefix='/usr' \
    --disable-schemas-compile
  make
}

package() {
  cd gala

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
