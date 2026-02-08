# Maintainer: soymadip
pkgname=mpv-modernx
_pkgname=ModernX
pkgver=0.4.5
pkgrel=2
pkgdesc="A fork of modernX (based on mpv-osc-modern), that aims to mirror the functionality of MPV's stock OSC while with a more modern-looking interface."
arch=('any')
url="https://github.com/zydezu/ModernX"
license=('unknown')
depends=('mpv')
optdepends=(
  'yt-dlp: for downloading videos'
  'ffmpeg: for downloading videos'
  'mpv-thumbfast-git: for thumbnails'
)
conflicts=("${pkgname}-git")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/zydezu/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}-${pkgver}"

  # Install the script
  install -Dm644 modernx.lua "$pkgdir/etc/mpv/scripts/modernx.lua"

  # Install the font
  install -Dm644 fluent-system-icons.ttf "$pkgdir/usr/share/fonts/TTF/fluent-system-icons.ttf"

  # Install README and assets
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
