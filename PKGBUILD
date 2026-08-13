# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=aq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.6.0
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
b2sums=('7c13fbe8369dd56999403a0426aff9bc84fca7034260a2566580a2b64e900dd0fb9e5f29c385d1e6614609ed9a7f3a49a1556f5b4fc4139b9d0b8525e18bc3cd')

package() {
  # binary
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # license
  install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # documentation
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
