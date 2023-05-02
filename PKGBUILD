# Maintainer: Djuice <felhamed@gmail.com>
pkgname=cryptowatch-desktop-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Charting & trading terminal for cryptocurrency markets"
arch=('x86_64')

url="https://cryptowat.ch/apps/desktop"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
provides=('cryptowatch-desktop-bin')

source=(
  "cryptowatch_desktop::https://cryptowat.ch/desktop/download/linux-x86/${pkgver}"
  "cryptowatch.desktop"
  "cryptowatch.png"
)

sha256sums=(
  'dfdda61717c0236af07f5e99afcf4d6b89e8d158ad196f6faf94056784870acd'
  'a5f93d812911662c3d7caaa9d068d17a982fd0f0ce0c34eae2beaab439d9bf72'
  'e4e2a8c671013a37bdc888680ce2159f2e4222746502a9b0ddc73ff199be00a7'
)

package(){
  install -Dm 775 "${srcdir}/cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch"
  install -Dm644 "${srcdir}/cryptowatch.desktop" "${pkgdir}"/usr/share/applications/cryptowatch.desktop
  install -Dm644 "${srcdir}/cryptowatch.png" "${pkgdir}"/usr/share/pixmaps/cryptowatch.png
}
