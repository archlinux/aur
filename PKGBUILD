# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="vdi-stream-client"
pkgdesc="A tiny and low latency desktop streaming client for remote Windows guests with GPU passthrough"
pkgver="0.5.1"
pkgrel="1"
arch=("x86_64")
url="https://libmpq.org/"
license=("GPL")
depends=(
  "ffmpeg"
  "libdrm"
  "libplacebo"
  "libusb"
  "libva"
  "sdl3"
  "sdl3_ttf"
  "usbredir"
  "vulkan-headers"
  "parsec-sdk-bin"
)
source=(
  "https://github.com/mbroemme/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  "6759b201ba89e0a0c65ef5b25df38c4ff93efc3fc1a6a5923130b616ee427221"
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
