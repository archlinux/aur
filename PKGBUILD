# Maintainer: sandwichfarm <sandwich.farm@protonmail.com>

pkgname=nsyte-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="Publish your site to nostr and blossom servers"
arch=('x86_64')
# NOTE: aarch64 support pending release.yml aarch64 Linux build step - re-add when binary is published
url="https://github.com/sandwichfarm/nsyte"
license=('MIT')
provides=('nsyte')
conflicts=('nsyte')
source_x86_64=(
  "nsyte-linux-${pkgver}::https://github.com/sandwichfarm/nsyte/releases/download/v${pkgver}/nsyte-linux-${pkgver}"
)
sha256sums_x86_64=('8289ff33790332186124174cd647581ee604ada72e6cd202279e0087bf2bebdf')

package() {
  install -Dm755 "nsyte-linux-${pkgver}" "${pkgdir}/usr/bin/nsyte"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<LICENSE
MIT License - see https://github.com/sandwichfarm/nsyte/blob/main/LICENSE
LICENSE
}
