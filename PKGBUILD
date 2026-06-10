pkgname=disgord-lyrics-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Update Discord custom status with synchronized lyrics from the currently playing song"
arch=('x86_64')
url="https://github.com/kristyancarvalho/disGOrd-lyrics"
license=('MIT')
provides=('disgord-lyrics')
conflicts=('disgord-lyrics')
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/disgord-lyrics-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('d06f7836087b66f7ee1b65f005871467d55b876f5720cef04962936c3cff3b9a')

package() {
  install -Dm755 "${srcdir}/disgord-lyrics" "${pkgdir}/usr/bin/disgord-lyrics"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/config-example.toml" "${pkgdir}/usr/share/doc/${pkgname}/config-example.toml"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/docs"
  cp -r "${srcdir}/docs/." "${pkgdir}/usr/share/doc/${pkgname}/docs/"
}
