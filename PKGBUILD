# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=gala-bzr
pkgver=r463
pkgrel=1
pkgdesc='The Pantheon Window Manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/gala'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'granite-bzr' 'mutter' 'plank')
makedepends=('bzr' 'gnome-common' 'intltool' 'vala')
provides=('gala')
conflicts=('gala')
install='gala.install'
source=('gala::bzr+http://bazaar.launchpad.net/~gala-dev/gala/trunk/')
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
