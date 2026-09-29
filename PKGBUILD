# Maintainer: Sable Maintainers <https://github.com/SableClient/Sable>

pkgname=sable-bin
pkgver=1.22.10
pkgrel=1
pkgdesc="An almost stable Matrix client"
arch=('x86_64')
url="https://github.com/SableClient/Sable"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'libcups'
  'libdrm'
  'mesa'
  'libxkbcommon'
  'libxss'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'at-spi2-core'
  'dbus'
  'libayatana-appindicator'
  'hicolor-icon-theme'
  'desktop-file-utils'
  'xdg-utils'
)
provides=('sable')
conflicts=('sable' 'sable-nightly-bin')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Sable-${pkgver}-linux-x86_64.deb")
sha256sums_x86_64=('9d96a6c0916cec51287eec69c1fca9ec8f2b9e4dc34547c7dfa05b5bfa0c57f0')

package() {
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
}
