# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cloofy-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Spotify and YouTube Music client that plays on its own, with Home, Spotify's DJ, synced lyrics"
arch=('x86_64' 'aarch64')
url="https://github.com/parda21/cloofy"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc' 'libpulse')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cloofy-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cloofy-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6be30daa03bd648aa7cf4b20f7e161440889b5b394fe5aecc53bb9cd1ddadddb')
sha256sums_aarch64=('869a45af400007be187cd2e1bd08df87aec4b1aabcc3742d42a8e1578e8f6419')

package() {
  install -Dm755 "cloofy" "${pkgdir}/usr/bin/cloofy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
