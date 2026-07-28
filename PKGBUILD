# Maintainer: Johan Slåttavik
pkgname=neon-breakout-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="A colorful and relaxing Breakout game by Yeloby"
arch=('x86_64')
url="https://github.com/Yeloby/neon-breakout"
license=('GPL-3.0-or-later')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss')
provides=('neon-breakout')
conflicts=('neon-breakout')
source=(
  "neon-breakout-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/neon-breakout-${pkgver}.tar.gz"
  "io.github.Yeloby.NeonBreakout.desktop::${url}/raw/v${pkgver}/packaging/flatpak/io.github.Yeloby.NeonBreakout.desktop"
  "io.github.Yeloby.NeonBreakout.svg::${url}/raw/v${pkgver}/packaging/flatpak/io.github.Yeloby.NeonBreakout.svg"
)
sha256sums=(
  '7e08219102ced70616a9852366388604c36ab0a99b01c4d7bb1d3eb5f603752b'
  '63300a6eed08e78999952ab1857de75c0751d545fb5abc32d295634046c8a951'
  '8b4c87d41069f614b1f2fba14148a45fe8381d567869a6525779c025932ca0ab'
)

package() {
  install -d "${pkgdir}/opt/neon-breakout"
  cp -a "${srcdir}/neon-breakout-${pkgver}/." "${pkgdir}/opt/neon-breakout/"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/neon-breakout/neon-breakout "${pkgdir}/usr/bin/neon-breakout"
  install -Dm644 "${srcdir}/io.github.Yeloby.NeonBreakout.desktop" \
    "${pkgdir}/usr/share/applications/io.github.Yeloby.NeonBreakout.desktop"
  install -Dm644 "${srcdir}/io.github.Yeloby.NeonBreakout.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.Yeloby.NeonBreakout.svg"
}
