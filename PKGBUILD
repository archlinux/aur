# Maintainer: Lukas Deutz <aur at deutz dot io>

pkgname=jqp-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A TUI playground to experiment with jq"
arch=('x86_64')
url="https://github.com/noahgorstein/jqp"
license=('MIT')
conflicts=('jqp')
depends=('tar')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/jqp_${pkgver}_Linux_${arch[0]}.tar.gz")
sha256sums=('9ce831b694d2ecb186259aa331aa4db97a88a5f4ea14d15910472b9d167f068a')

_bin='jqp'

package() {
  install -Dm 755 "${_bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
