# Maintainer: Maurício CA <mauricio.antunes@gmail.com>
pkgname=foo2zjs-utils
pkgver=20150704
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
sha256sums=('6ba509fd20e70ec511f48e7627ffa1bb14d8cbe390a71923e00c10e649000e8b')
build() {
  cd "$srcdir/foo2zjs"
  make
}

package() {
  cd "$srcdir/foo2zjs"
  make DESTDIR="$pkgdir/" install-test install-prog install-icc2ps install-man install-doc
}

# vim:set ts=2 sw=2 et:
