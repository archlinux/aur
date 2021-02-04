# Maintainer: Peter <craven@gmx.net>
pkgname=scheme-9-from-empty-space
pkgver=20181205
pkgrel=1
epoch=
pkgdesc="S9fES Reimagined is a mature, portable, and comprehensible interpreter for R4RS Scheme."
arch=(x86_64 i686)
url="http://www.t3x.org/s9fes/"
license=('unknown')
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
source=("http://www.t3x.org/s9fes/s9fes-$pkgver.tgz")
md5sums=('65e6582a0ede8100f7dd6b708f881201')
noextract=()
validpgpkeys=()

build() {
  cd s9
  make PREFIX=/usr
}

package() {
  cd s9
  sed -i -e 's/$(PREFIX)|/$(XPREFIX)|/' Makefile
  make PREFIX=${pkgdir}/usr XPREFIX=/usr install
}
