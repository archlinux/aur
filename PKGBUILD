# Maintainer: Marcus Johansson <polarn@gmail.com>

_realname=rift
pkgname=${_realname}-bin
pkgver=5.24.0
pkgrel=1
pkgdesc="The RIFT Intel Fusion Tool, for Eve Online"
arch=('x86_64')

url="https://riftforeve.online/"

license=('custom')

depends=(
  'alsa-lib'
  'freetype2'
  'gcc-libs'
  'glibc'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'zlib'
)

optdepends=(
  'wayland: native Wayland rendering'
  'xorg-xwayland: X11 fallback on Wayland sessions'
)

provides=("${_realname}")

conflicts=("${_realname}")

source=("https://riftforeve.online/download/debian/${_realname}_${pkgver}_amd64.deb")

sha256sums=('38d47d85979d13a91f8de5e433b009762f71cb43484bc203131cc88362336544')

prepare() {
  bsdtar -x -f data.tar.xz || bsdtar -x -f data.tar.gz || bsdtar -x -f data.tar.zst || true
}

build() {
  echo "Nothing to build, using pre-compiled binaries."
}

package() {
  cp -dr --no-preserve=ownership usr/ "${pkgdir}/"
}
