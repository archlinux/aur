# Maintainer: ChTBoner
pkgname=snitch-input-display
pkgver=1.1.0rc1
pkgrel=1
pkgdesc="Displays your SNES input reading directly from the console data"
license=("GPL3")
arch=("x86_64")
provides=("SnITCH")
depends=("alsa-lib" "systemd-libs")
url="https://github.com/ChTPwner/SnITCH"
_tag="v1.1.0-rc1"
source=("SnITCH-linux-x86_64::https://github.com/ChTPwner/SnITCH/releases/download/${_tag}/SnITCH-linux-x86_64"
  "SnITCH.desktop::https://raw.githubusercontent.com/ChTPwner/SnITCH/${_tag}/dist/arch/SnITCH.desktop"
  "SnITCH.png::https://raw.githubusercontent.com/ChTPwner/SnITCH/${_tag}/images/icon.png")
sha256sums=(
  "7356b0aa2240d99873114e8cfc3e06a9f2d9888eb57fee986392f649ab367ade"
  "65aaac91dcab166fab0fc56d85083cbe0af83ecef4ef5d126562cd4c633a6869"
  "8a0981e8c4e1593aca244881f5c491da0dbe914e44550650afc25aa2e3a9f069"
)

package() {
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/applications"
  install -dm 755 "$pkgdir/usr/share/pixmaps"
  install -m 644 "$srcdir/SnITCH.png" "$pkgdir/usr/share/pixmaps/SnITCH.png"
  install -m 755 "$srcdir/SnITCH-linux-x86_64" "$pkgdir/usr/bin/SnITCH"
  install -m 644 "$srcdir/SnITCH.desktop" "$pkgdir/usr/share/applications/SnITCH.desktop"
}
