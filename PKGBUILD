# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-photos-bzr
pkgver=r2788
pkgrel=1
pkgdesc='The Pantheon Photos Manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-photos'
license=('GPL3')
groups=('pantheon-unstable')
depends=('desktop-file-utils' 'libgexiv2' 'libgphoto2' 'libraw' 'webkitgtk'
         'libgranite.so')
makedepends=('bzr' 'granite-bzr' 'vala')
provides=('pantheon-photos')
conflicts=('pantheon-photos')
install='pantheon-photos.install'
source=('bzr+lp:pantheon-photos')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-photos

  echo "r$(bzr revno)"
}

build() {
  cd pantheon-photos

  ./configure \
    --prefix='/usr' \
    --libexec='/usr/lib/shotwell' \
    --disable-desktop-update \
    --disable-icon-update \
    --disable-schemas-compile
  make
}

package() {
  cd pantheon-photos

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
