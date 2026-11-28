# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gh-infra-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Declarative GitHub infrastructure management via YAML"
arch=('x86_64' 'aarch64')
url="https://github.com/babarot/gh-infra"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gh-infra_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gh-infra_linux_arm64.tar.gz")
sha256sums_x86_64=('ff0e5228d83fca85ff9ddfd27c861efbdb79ca3fcc076c81a598b23b03639c78')
sha256sums_aarch64=('5b2f9147bbb9d80c6e948720ec53bcf463256e1ad3b532ca8d062be46d1a4d7b')

package() {
  install -Dm755 "gh-infra" "${pkgdir}/usr/bin/gh-infra"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
