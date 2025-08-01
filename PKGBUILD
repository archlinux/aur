# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/terramate-io/terramate"
conflicts=('terramate')
provides=('terramate')
license=('MPL-2')
source=(
  "https://github.com/terramate-io/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_x86_64.tar.gz"
  "https://github.com/terramate-io/${_pkggit}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('bc5c77b634d146ff85f476eafa9672590699cb4b444249c68775550d240a8169'
            'fb9dfeb7395e10e2000ed67ab9a6e40edea6d31efcc9f5a84a95f274cb9ec8b9')

depends=()
makedepends=()

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm755 ${_pkggit}-ls ${pkgdir}/usr/bin/${_pkggit}-ls
  install -D -m 644 "${srcdir}/${_pkggit}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
