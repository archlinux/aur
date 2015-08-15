# Maintainer: Javier Tia <javier.tia at gmail dot com>
pkgname=gphotofs
pkgver=0.5
pkgrel=3
pkgdesc="FUSE filesystem module to mount your camera as a filesystem on Linux."
arch=('i686' 'x86_64')
url="http://www.gphoto.org/proj/gphotofs/"
license=('GPL2')
depends=('fuse' 'glib2' 'libgphoto2')
makedepends=('pkgconfig')
source=("http://downloads.sourceforge.net/sourceforge/gphoto/gphotofs-${pkgver}.tar.bz2")
sha256sums=('676ec4de69a81c193ffc31bdc7b587ac2a2cc3780b14f0e7c9c4c0a517b343cc')

build() {
  cd "${srcdir}/gphotofs-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/gphotofs-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ft=sh ts=2 sw=2 et:
