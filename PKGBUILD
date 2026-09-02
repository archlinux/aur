# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="libmpq"
pkgdesc="A C library for reading and creating Blizzard MPQ archives"
pkgver="0.6.1"
pkgrel="1"
arch=("x86_64")
url="https://libmpq.org/"
license=("LGPL-2.1-or-later")
depends=(
  "bzip2"
  "zlib"
)
source=(
  "https://github.com/mbroemme/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  "ed8ad7151f0966dabfa5cba923de94989e1c0c0e954471b486cd7abfcafa879c"
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
