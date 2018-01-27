# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
# Contributor: Natalia Portillo <claunia@clania.com>
pkgname=pcem
pkgver=13.1
pkgrel=2
pkgdesc="Emulator for various IBM PC computers and clones."
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('allegro4' 'freealut' 'openal')
source=("http://pcem-emulator.co.uk/files/PCemV${pkgver}Linux.tar.gz")

build() {
  cd "${srcdir}"
  ./configure --enable-release-build --prefix=/usr
  make
}

package() {
  cd "${srcdir}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
sha256sums=('97f73b7a5a6b277c150b4e505a0b1018fed6157f905b1fef7134b51cc7c84586')
