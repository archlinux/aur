# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.14.3
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
sha256sums=('7c9eaef686d78736eb674e4e480cbd9ed90d353a225bd93bb6a2866f68053ecf'
            '910418ba8b6a6b399316522d7f07fa796cda7388e32509b25a2b22cafde51957')

depends=()
makedepends=()

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm755 ${_pkggit}-ls ${pkgdir}/usr/bin/${_pkggit}-ls
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
