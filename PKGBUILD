# Maintainer: Tsiry Sandratraina <tsiry.sndr@rocksky.app>

pkgname=tunein-cli-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Browse and listen to thousands of radio stations across the globe right from your terminal 🌎 📻 🎵✨"
arch=('x86_64')
url="https://github.com/tsirysndr/tunein-cli"
source=("$url/releases/download/v${pkgver/_/-}/tunein_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0975df3e213d4a23714036a1c349a7bf29df8feb84f5cc729928c92301e76a57')
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
