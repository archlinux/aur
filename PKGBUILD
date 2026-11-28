# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=diffyml-bin
pkgver=1.8.3
pkgrel=1
pkgdesc="Fast structural YAML diff tool"
arch=('x86_64' 'aarch64')
url="https://github.com/szhekpisov/diffyml"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/diffyml_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/diffyml_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4283dd3842d87ff9def4a2649ae2627ce90dce2602e2b23fe0a54d1e829f1c42')
sha256sums_aarch64=('9e7e3055e7f91e7dcbac65bca7bc7e403f5f32c98bf7730a1d70dc4da4680d9e')

package() {
  install -Dm755 "diffyml" "${pkgdir}/usr/bin/diffyml"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
