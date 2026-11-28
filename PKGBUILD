# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yatas-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Audit AWS and GCP infrastructure for misconfigurations and security issues"
arch=('x86_64' 'aarch64')
url="https://github.com/padok-team/yatas"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/yatas_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/yatas_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('fb752b659d5c351a24e1e02b2c744143357eaf5fb1569958e933fe2e37aa71fd')
sha256sums_aarch64=('6df3aaf257cc0787ca7989370cca0d3c8e5959e8bf3c038ed85a2ab846f6c7d8')

package() {
  install -Dm755 "yatas" "${pkgdir}/usr/bin/yatas"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
