# Maintainer: Marcus Johansson <polarn@gmail.com>

_realname=rift
pkgname=${_realname}-bin
pkgver=5.16.2
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
  'openal'
  'zlib'
)

optdepends=(
  'xorg-xwayland'
)

provides=("${_realname}")

conflicts=("${_realname}")

source=("https://riftforeve.online/download/debian/${_realname}_${pkgver}_amd64.deb")

sha256sums=('19170c1b804b1ef0a7b437e3546f6993883d6b1857c3cdf7073187f0a09f9004')

prepare() {
  bsdtar -x -f data.tar.xz || bsdtar -x -f data.tar.gz || bsdtar -x -f data.tar.zst || true
}

build() {
  echo "Nothing to build, using pre-compiled binaries."
}

package() {
  cp -dr --no-preserve=ownership usr/ "${pkgdir}/"
}
