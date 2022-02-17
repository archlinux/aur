# Maintainer: Djuice <felhamed@gmail.com>
pkgname=cryptowatch-desktop-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Charting & trading terminal for cryptocurrency markets"
arch=('x86_64')

url="https://cryptowat.ch/apps/desktop"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
provides=('cryptowatch-desktop-bin')

source=(
  "cryptowatch_desktop::https://cryptowat.ch/desktop/download/linux/${pkgver}"
  "cryptowatch.desktop"
  "cryptowatch.png"
)

sha256sums=(
  '8c18788228e87e89d115275907c06f1cb5cc81b7b6b9e50314eda9f5cbd4b182'
  '542ab64620e04481b75a3f787643deab91887ceffe7423c933dc18db8a5ade8a'
  'e4e2a8c671013a37bdc888680ce2159f2e4222746502a9b0ddc73ff199be00a7'
)

package(){
  install -Dm 775 "${srcdir}/cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch"
  install -Dm644 "${srcdir}/cryptowatch.desktop" "${pkgdir}"/usr/share/applications/cryptowatch.desktop
  install -Dm644 "${srcdir}/cryptowatch.png" "${pkgdir}"/usr/share/pixmaps/cryptowatch.png
}
