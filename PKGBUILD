# Maintainer: Marcus Johansson <polarn@gmail.com>

_realname=rift
pkgname=${_realname}-bin
pkgver=5.27.0
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

sha256sums=('6c1726baf6ba3a7ee55efd5e75e327e11a4bb05feab2a1598c714b17adc1d759')

prepare() {
  bsdtar -x -f data.tar.xz || bsdtar -x -f data.tar.gz || bsdtar -x -f data.tar.zst || true
}

build() {
  echo "Nothing to build, using pre-compiled binaries."
}

package() {
  cp -dr --no-preserve=ownership usr/ "${pkgdir}/"
}
