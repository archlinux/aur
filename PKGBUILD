# Maintainer: Mohammed Efaz <mohammedefaz@gmail.com>
pkgname=melearner-bin
_pkgname=melearner
pkgver=0.1.4
pkgrel=1
pkgdesc="A native desktop app for learning from your local course library"
arch=('x86_64')
url="https://github.com/WhiteHades/melearner"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'ffmpeg'
  'xdg-utils'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
optdepends=(
  'pipewire: audio backend'
  'pulseaudio: audio backend'
  'alsa-lib: audio backend'
)
options=('!strip' '!debug' '!lto')

source_x86_64=("${_pkgname}-${pkgver}.deb::https://github.com/WhiteHades/melearner/releases/download/v${pkgver}/${_pkgname}-linux-x86_64.deb")

sha256sums_x86_64=('e1225dd5b237979bb6279928932cf646d9a62abd3a420b55c5d18a51ffad3f21')

package() {
  cd "$srcdir"

  ar x "${_pkgname}-${pkgver}.deb"
  tar -xf data.tar.gz -C "$pkgdir"
}
