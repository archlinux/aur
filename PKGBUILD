# Maintainer: Your Name <you@example.com>

pkgname=pebble-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Local-first desktop email client built with Tauri"
arch=("x86_64")
url="https://github.com/QingJ01/Pebble"
license=("AGPL-3.0-only")
depends=(
  "dbus"
  "fuse2"
  "gtk3"
  "hicolor-icon-theme"
  "libayatana-appindicator"
  "libsecret"
  "libxdo"
  "openssl"
  "webkit2gtk-4.1"
)
optdepends=(
  "gnome-keyring: credential storage backend on GNOME-like desktops"
  "kwallet: credential storage backend on KDE Plasma"
)
provides=("pebble")
conflicts=("pebble")
options=("!strip")

_appimage="Pebble_${pkgver}_amd64.AppImage"

source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "pebble-bin.sh"
  "pebble.desktop"
  "pebble.png::${url}/raw/v${pkgver}/src/assets/app-icon.png"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
sha256sums[0]=e0a6d28759fb9966370a858911e19ae6bd5c48fd986ebebfd54d8379d687a5e3
sha256sums[1]=3f57c46804cfb942f87004fc65b47dac9beb53d4617a755a14a2f2e098bdf6e0
sha256sums[2]=3cbe399effb8a4e2c3ed81e755d658a1c91bf4acde14a62da080fcd68759e531
sha256sums[3]=2046e17e3364fc192e320b9e558ea692115a41a71104fba782d79018813f9614
sha256sums[4]=0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/Pebble.AppImage"
  install -Dm755 "${srcdir}/pebble-bin.sh" "${pkgdir}/usr/bin/pebble"
  install -Dm644 "${srcdir}/pebble.desktop" "${pkgdir}/usr/share/applications/pebble.desktop"
  install -Dm644 "${srcdir}/pebble.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pebble.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
