# Maintainer: Lukas Deutz <aur at deutz dot io>

pkgname=jqp-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="A TUI playground to experiment with jq"
arch=('x86_64')
url="https://github.com/noahgorstein/jqp"
license=('MIT')
conflicts=('jqp')
provides=("jqp=${pkgver}")
depends=('tar')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/jqp_Linux_${arch[0]}.tar.gz")
sha256sums=('53d595ad76f2a91dcba0b1de71f720c36c3021e37fe114184b4eb4d949c4d2bc')

_bin='jqp'

package() {
  install -Dm 755 "${_bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

