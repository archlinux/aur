# Maintainer: Lukas Deutz <aur at deutz dot io>

pkgname=jqp-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="A TUI playground to experiment with jq"
arch=('x86_64')
url="https://github.com/noahgorstein/jqp"
license=('MIT')
conflicts=('jqp')
depends=('tar')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/jqp_${pkgver}_Linux_${arch[0]}.tar.gz")
sha256sums=(7456b61ce3bde270f955df71cdbb9281b9002a0a2cb57372b85c9ff105520593)

_bin='jqp'

package() {
  install -Dm 755 "${_bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
