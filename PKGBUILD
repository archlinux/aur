# Maintainer: Natalia Portillo <claunia@clania.com>
pkgname=pcem
pkgver=10.1
pkgrel=2
pkgdesc="Emulator for various IBM PC computers and clones."
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('allegro4' 'freealut' 'openal')
makedepends=('automake-1.11')
source=("http://pcem-emulator.co.uk/files/PCemV${pkgver}Linux.tar.gz")
md5sums=('5ba3f5ddc066436cdbc7c664d0a6a4ef')

build() {
  cd "${srcdir}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
