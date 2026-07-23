# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=aq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.0
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
b2sums=('18e0bbf3eefae27d0bbec1f9392a8aa7d3c50217c77946ce7ff2b1fcd1f7f4e5faa69b8a9e968b751ea0c6408c6549494568168a18944d3b162e9769bf985365')

package() {
  # binary
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # license
  install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # documentation
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
