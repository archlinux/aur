# Maintainer: Jose Cardoso <archlinux.org@josecardoso.com>
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terramate

pkgname=terramate-bin
pkgver=0.17.3
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
sha256sums=(
  '303fd597a76af00c728b3eb626493dc2a71585dcd679c5e07a338da44d24a060'
  'b783e10d2045401fa42187b58a759d8dd75035ef9811befe9c4a4f788bddf61e'
)

depends=()
makedepends=()

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm755 ${_pkggit}-ls ${pkgdir}/usr/bin/${_pkggit}-ls
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_pkggit}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
