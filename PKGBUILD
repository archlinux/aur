# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=aq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.0
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
b2sums=('f1605cc72b9f50bf190eecbf114a2ad62c54df1ce1ccfec26b3e0c812f51c0dd30dfd0667966d3df2389c14e6196c57887522780496acb0cd0afbf151ed46d07')

package() {
  # binary
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"

  # license
  install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # documentation
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
