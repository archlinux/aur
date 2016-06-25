# Maintainer: Natalia Portillo <claunia@clania.com>
pkgname=pcem
pkgver=11
pkgrel=1
pkgdesc="Emulator for various IBM PC computers and clones."
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('allegro4' 'freealut' 'openal')
makedepends=('automake-1.11')
source=("http://pcem-emulator.co.uk/files/PCemV${pkgver}Linux.tar.gz")
md5sums=('e37646e9067d18a3fa8c1d6d0b6b594a')

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
