# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.14.7
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
sha256sums=('ea4af9ba034ca25be9aaa09cc3b33c2d182be986ce12bb5c5b1681aa22ef83e4'
            '36d71ed54634af2f61958bcf139db5509f1307064716fc1aa180ab97d3a9b668')

depends=()
makedepends=()

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm755 ${_pkggit}-ls ${pkgdir}/usr/bin/${_pkggit}-ls
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
