# Contributor: Lukas Deutz <aur at deutz dot io>
# Contributor: tee < teeaur at duck dot com >

pkgname=jqp-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A TUI playground to experiment with jq"
arch=('x86_64')
url="https://github.com/noahgorstein/jqp"
license=('MIT')
conflicts=('jqp')
provides=("jqp=${pkgver}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/jqp_Linux_${arch[0]}.tar.gz")
sha256sums=('66b2a100ff114a8bbe45a8e6052269fb2f4c61de4edd5ea57b763bf2ec7c6593')

_bin='jqp'

package() {
  install -Dm755 "${_bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

