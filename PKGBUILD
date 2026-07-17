# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=aq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.0
pkgrel=1
pkgdesc='Like jq, but for JSON, TOML & YAML'
arch=('x86_64')
url="https://github.com/rossmacarthur/${_pkgname}"
license=('Apache' 'MIT')
depends=('jq')
provides=("${_pkgname}")
conflicts=(
	"${_pkgname}"
	"${_pkgname}-git"
)
makedepends=('tar')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('661d42c0f3ca262e0c78855b07ffa5676af8999d99373392a5e3e3bdf5e8a99f7e641d3010b157097917da43512ca6dde72de2450ae6c1723473a4308d38a11c')

package() {
  # binary
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # license
  install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # documentation
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
