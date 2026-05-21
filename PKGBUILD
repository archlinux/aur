pkgname=mpc-autofill-bin
pkgver=4.7
pkgrel=1
pkgdesc='Print automation software for MakePlayingCards tabletop card orders'
arch=('x86_64')
url='https://github.com/chilli-axe/mpc-autofill'
license=('GPL-3.0-only')
depends=('bash' 'glibc')
options=('!strip' '!debug')
optdepends=(
  'chromium: Chromium browser backend'
  'google-chrome: default Chrome browser backend'
  'brave-bin: Brave browser backend'
  'microsoft-edge-stable-bin: Edge browser backend'
)
provides=("mpc-autofill=${pkgver}")
conflicts=('mpc-autofill')
source=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/autofill-linux.zip"
  "mpc-autofill-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/chilli-axe/mpc-autofill/v${pkgver}/LICENSE.md"
  'mpc-autofill'
)
sha256sums=(
  '9c78a438105f97c1cfc373956b26029716eb7c4e204896c13d73c73ab230ef54'
  'f817886ee6bb65ed3098a7987b1e9781653d15c71f85589ce0d2af663c66d373'
  'e0270fbb05ccae97d3b4aacf42a8ca5b78e774dd3b1abd8376f664e8032dda41'
)

package() {
  install -Dm755 autofill-linux.bin "${pkgdir}/usr/lib/mpc-autofill/autofill-linux.bin"
  install -Dm755 mpc-autofill "${pkgdir}/usr/bin/mpc-autofill"
  install -Dm644 "mpc-autofill-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
