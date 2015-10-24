# Maintainer: Maurício CA <mauricio.antunes@gmail.com>
pkgname=foo2zjs-utils
pkgver=20151011
pkgrel=1
epoch=
pkgdesc="Linux printer driver for ZjStream protocol"
arch=(i686 x86_64)
url="http://foo2zjs.rkkda.com"
license=('GPL')
groups=()
depends=(foomatic-db foomatic-filters ghostscript bc)
makedepends=(make gzip coreutils)
checkdepends=()
optdepends=(cups)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/foo2zjs.tar.gz")
noextract=()
sha256sums=('41ac200b17b547f3aa2d2aea8c220677273dcb7ecfbfec3c64cee2156898ea4c')
build() {
  cd "$srcdir/foo2zjs"
  make
}

package() {
  cd "$srcdir/foo2zjs"
  make DESTDIR="$pkgdir/" install-test install-prog install-icc2ps install-man install-doc
}

# vim:set ts=2 sw=2 et:
