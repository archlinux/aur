# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=tunein-cli-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Browse and listen to thousands of radio stations across the globe right from your terminal 🌎 📻 🎵✨"
arch=('x86_64')
url="https://github.com/tsirysndr/tunein-cli"
source=("$url/releases/download/v${pkgver/_/-}/tunein_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('804e60e7e11e943e9322ec85c9f6fe4c309164b8fddb50277cda5b6032dee976')
depends=('alsa-lib')
license=('MIT')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  tar xvf "${srcdir}/tunein_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/tunein"
  mkdir -p "${pkgdir}/usr/share/doc/tunein"
  mv "${pkgdir}/usr/bin/LICENSE" "${pkgdir}/usr/share/licenses/tunein"
  mv "${pkgdir}/usr/bin/README.md" "${pkgdir}/usr/share/doc/tunein"
}
