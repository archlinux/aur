# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="libmpq"
pkgdesc="A C library for reading and creating Blizzard MPQ archives"
pkgver="0.7.0"
pkgrel="1"
arch=("x86_64")
url="https://libmpq.org/"
license=("LGPL-2.1-or-later")
depends=(
  "bzip2"
  "xz"
  "zlib"
)
source=(
  "https://github.com/mbroemme/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  "79a606e9588c5a590563e4037aa33962d40dfba8dac0ae63c6a3be4555ec5415"
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
