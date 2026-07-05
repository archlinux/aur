# Maintainer: Mohammed Efaz <mohammedefaz@gmail.com>
pkgname=melearner-bin
_pkgname=melearner
pkgver=0.1.8
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
  'gst-libav'
  'gst-plugins-good'
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

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/WhiteHades/melearner/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")

sha256sums_x86_64=('0b7bdce05c1bfe334e39bb97d53ba9632d07fd2686f795dfe1f3f7281725c62c')

package() {
  cd "$srcdir"

  tar -xf "${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir"
  rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
