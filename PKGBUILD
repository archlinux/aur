# Maintainer: Lukas Deutz <aur at deutz dot io>

pkgname=jqp-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI playground to experiment with jq"
arch=('x86_64')
url="https://github.com/noahgorstein/jqp"
license=('MIT')
conflicts=('jqp')
depends=('tar')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/jqp_${pkgver}_Linux_${arch[0]}.tar.gz")
sha256sums=('8736e220b34f0b7f71c0648752897eca383c08e6f84d426c6c426d8f79fa2231')

_bin='jqp'

package() {
  install -Dm 755 "${_bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
