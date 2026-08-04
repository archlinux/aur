# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=aq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.2
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
b2sums=('c1ad1af9a6e944387fd39871eabd5b1db430aa2a7f693f4887e5052449dd24c4f0e8dcd55385c6bcc073e66d97964e10f0a3e4345925196069705cbf26f0ae7a')

package() {
  # binary
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # license
  install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # documentation
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
