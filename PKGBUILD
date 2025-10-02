# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.14.6
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
sha256sums=('703636acc21764d41b894df4562f61e9ba4baba3ca4bc5fd985ad9b2647ec86b'
            'a63b312a0b6788b596119358bf0b18ff58f3145ff2bde5164077cfcacfe9b8d9')

depends=()
makedepends=()

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm755 ${_pkggit}-ls ${pkgdir}/usr/bin/${_pkggit}-ls
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
