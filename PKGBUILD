# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=permify-bin
pkgver=1.7.6
pkgrel=1
pkgdesc="An open-source authorization as a service inspired by Google Zanzibar, designed to build and manage fine-grained and scalable authorization systems for any application"
arch=('x86_64' 'aarch64')
url="https://github.com/Permify/permify"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/permify_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/permify_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('112b9d669e7cd47e52c1384cbfbdefbe29f3872a3d41756f5ba9a26f800bf199')
sha256sums_aarch64=('b3cf84646fc9f97814cb38a7542fccbc6db232f41615c800db710a93c2e9640b')

package() {
  install -Dm755 "permify" "${pkgdir}/usr/bin/permify"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
