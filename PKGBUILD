# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="vdi-stream-client"
pkgdesc="A tiny and low latency desktop streaming client for remote Windows guests with GPU passthrough"
pkgver="0.3.0"
pkgrel="1"
arch=("x86_64")
url="https://libmpq.org/"
license=("GPL")
depends=("sdl3" "sdl3_ttf" "usbredir" "parsec-sdk-bin")
source=(
  "https://github.com/mbroemme/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  "e2f94974df5265d6a80ab8e5051ac22b3f22fe12200776e5411ddaf04f45eb00"
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
