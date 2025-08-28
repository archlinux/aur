# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=tunein-cli-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Browse and listen to thousands of radio stations across the globe right from your terminal 🌎 📻 🎵✨"
arch=('x86_64')
url="https://github.com/tsirysndr/tunein-cli"
source=("$url/releases/download/v${pkgver/_/-}/tunein_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a4945f497bd35da41a8442a40358f7bab548712667e1703ad68e719b0d6b5df6')
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
