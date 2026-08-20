# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="libmpq"
pkgdesc="A C library for reading and creating Blizzard MPQ archives"
pkgver="0.5.1"
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
  "f260d209b91e5185fd7be6f3908c2adac0a688a51e68e5e734c542dc7b955d19"
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
