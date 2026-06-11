# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="vdi-stream-client"
pkgdesc="A tiny and low latency desktop streaming client for remote Windows guests with GPU passthrough"
pkgver="0.4.0"
pkgrel="1"
arch=("x86_64")
url="https://libmpq.org/"
license=("GPL")
depends=("ffmpeg" "libdrm" "libplacebo" "sdl3" "sdl3_ttf" "usbredir" "parsec-sdk-bin")
source=(
  "https://github.com/mbroemme/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  "3560db0bce4ca57d9d7ec002fa9a67bc19ffb093ba36529bb2d0b9a95f366d58"
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
