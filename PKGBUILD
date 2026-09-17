# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="libmpq"
pkgdesc="A C library for reading and creating Blizzard MPQ archives"
pkgver="0.7.1"
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
  "c4e242dd1126d73b95a8eebc8bf87a503bdf2593b68deb81fa7aae20b6dd30fa"
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
