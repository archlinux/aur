# Maintainer: Mohammed Efaz <mohammedefaz@gmail.com>
pkgname=melearner-bin
_pkgname=melearner
pkgver=0.1.0
pkgrel=1
pkgdesc="A native desktop app for learning from your local course library"
arch=('x86_64' 'aarch64')
url="https://github.com/WhiteHades/melearner"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
optdepends=(
  'pipewire: audio backend'
  'pulseaudio: audio backend'
  'alsa-lib: audio backend'
)
options=('!strip' '!debug' '!lto')

source_x86_64=("${_pkgname}-${pkgver}.deb::https://github.com/WhiteHades/melearner/releases/download/v${pkgver}/melearner_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}.deb::https://github.com/WhiteHades/melearner/releases/download/v${pkgver}/melearner_${pkgver}_arm64.deb")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  cd "$srcdir"

  ar x "${_pkgname}-${pkgver}.deb"
  tar -xf data.tar.gz -C "$pkgdir"
}
