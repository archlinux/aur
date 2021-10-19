# Maintainer: Djuice <felhamed@gmail.com>
pkgname=cryptowatch-desktop-bin
pkgver=0.4.4
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
  '4327d4f7440b139be8adc032695fbbce98f5f6a11ee9ecd79f1da012c0c80a34'
  '542ab64620e04481b75a3f787643deab91887ceffe7423c933dc18db8a5ade8a'
  'e4e2a8c671013a37bdc888680ce2159f2e4222746502a9b0ddc73ff199be00a7'
)

package(){
	# Extract package data
        install -Dm 775 "${srcdir}/cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch"
        install -Dm644 "${srcdir}/cryptowatch.desktop" "${pkgdir}"/usr/share/applications/cryptowatch.desktop
        install -Dm644 "${srcdir}/cryptowatch.png" "${pkgdir}"/usr/share/pixmaps/cryptowatch.png
}
