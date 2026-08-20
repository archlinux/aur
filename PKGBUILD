# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="libmpq"
pkgdesc="A C library for reading and creating Blizzard MPQ archives"
pkgver="0.6.0"
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
  "ffc2fd0b3a6f551015ff7db7912b4862a3afb61778cefbe7811e0516777cef96"
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
