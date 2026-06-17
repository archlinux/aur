# Maintainer: Marcus Johansson <polarn@gmail.com>

_realname=rift
pkgname=${_realname}-bin
pkgver=5.24.3
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

sha256sums=('106d9e52e2e070d17b8ffe3cce661a52e106de11261ae67cbc1de65cf4c56e79')

prepare() {
  bsdtar -x -f data.tar.xz || bsdtar -x -f data.tar.gz || bsdtar -x -f data.tar.zst || true
}

build() {
  echo "Nothing to build, using pre-compiled binaries."
}

package() {
  cp -dr --no-preserve=ownership usr/ "${pkgdir}/"
}
