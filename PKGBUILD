#
# PKGBUILD for tass64
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=tass64
pkgver=1.51.675
pkgrel=1
epoch=
pkgdesc="tass64 is cross (turbo) assembler targeting the MOS 65xx series of micro processors (6502/65C02/R65C02/W65C02/65CE02/65816/DTV/65EL02)"
arch=('i686', 'x86_64')
url="http://tass64.sourceforge.net/"
license=('GPLv2')
_pkgname=64tass
_pkgver=${pkgver}
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/tass64/files/source/${_pkgname}-${pkgver}-src.zip")
noextract=()
md5sums=('efde2926572e0c4894c637ce7abe010a')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver-src"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-src"
  make -w --trace
}

check() {
  cd "$srcdir/$_pkgname-$pkgver-src"
  #make -w --trace -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver-src"
  install -d -m 755 "$pkgdir/usr/local/bin/"
  install -m 755 64tass "$pkgdir/usr/local/bin/tass64"
  install -d -m 755 "$pkgdir/usr/local/doc/tass64/"
  install -m 755 README "$pkgdir/usr/local/doc/tass64/"
  install -m 755 README.html "$pkgdir/usr/local/doc/tass64/"
}

# EOF
