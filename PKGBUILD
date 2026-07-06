# Maintainer: Mohammed Efaz <mohammedefaz@gmail.com>
pkgname=melearner-bin
_pkgname=melearner
pkgver=0.1.8
pkgrel=2
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

sha256sums_x86_64=('35d7f2d957813e4b23219fc6cb9603ba8a1ec58c082562fd002b71aa3df45402')

package() {
  cd "$srcdir"

  tar -xf "${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir"
  rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
