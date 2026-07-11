# Maintainer: Tsiry Sandratraina <tsiry.sndr@rocksky.app>

pkgname=tunein-cli-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Browse and listen to thousands of radio stations across the globe right from your terminal 🌎 📻 🎵✨"
arch=('x86_64')
url="https://github.com/tsirysndr/tunein-cli"
source=("$url/releases/download/v${pkgver/_/-}/tunein_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('93352d50c81ebf821d6b82ccc21882f23f951c333ba7f0b54c89a0a0a53121fa')
depends=('alsa-lib' 'dbus')
license=('MIT')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  tar xvf "${srcdir}/tunein_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/tunein"
  mkdir -p "${pkgdir}/usr/share/doc/tunein"
  mv "${pkgdir}/usr/bin/LICENSE" "${pkgdir}/usr/share/licenses/tunein"
  mv "${pkgdir}/usr/bin/README.md" "${pkgdir}/usr/share/doc/tunein"
}
