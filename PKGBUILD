# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pcf2bdf-git
pkgver=1.07.r0.g4e80d7f
pkgrel=1
epoch=1
pkgdesc="Convert X font from PCF to BDF"
arch=('i686' 'x86_64')
url="https://github.com/ganaware/pcf2bdf"
license=('custom:X11')
depends=('gcc-libs')
makedepends=('git')
provides=('pcf2bdf')
conflicts=('pcf2bdf')
source=('git+https://github.com/ganaware/pcf2bdf.git')
md5sums=('SKIP')

pkgver() {
  cd pcf2bdf
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	make -C "pcf2bdf" -f "Makefile.gcc"
}

package() {
	make -C "pcf2bdf" -f "Makefile.gcc" PREFIX=/usr DESTDIR="$pkgdir" install
}
