# Maintainer: acopier <acopierlive@gmail.com>
pkgname=wine-roblox-bin
pkgver=9.2
pkgrel=1
pkgdesc="Wine staging builds with patches specialized for running Roblox."
arch=('x86_64')
url="https://github.com/vinegarhq/wine-builds"
license=(LGPL-2.1-or-later)
depends=(
  attr
  fontconfig
  libxcursor
  libxrandr
  libxi
  gettext
  freetype2
  gcc-libs
  libpcap
  desktop-file-utils
)
optdepends=(
  libpulse              
  alsa-plugins
  alsa-lib
  opencl-icd-loader
  vulkan-icd-loader
)
provides=("wine-roblox=${pkgver}")
conflicts=("wine-roblox")
options=(!strip)
source=("${url}/releases/download/${pkgver}/wine-vinegarhq-build-${pkgver}.tar.xz")
sha256sums=("8f3831b3d6497c2f20bf76610d19573227c06398c92a519a6daf348bb1e5c51e")

package() {
  mkdir -p "${pkgdir}/opt/wine-roblox"
  tar -xf "wine-vinegarhq-build-${pkgver}.tar.xz" --strip-components=1 -C "${pkgdir}/opt/wine-roblox"
}

