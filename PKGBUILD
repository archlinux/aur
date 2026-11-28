# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tfschema-bin
pkgver=0.7.10
pkgrel=1
pkgdesc="Schema inspector for Terraform and OpenTofu providers"
arch=('x86_64' 'aarch64')
url="https://github.com/minamijoyo/tfschema"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tfschema_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tfschema_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('52b9316e6519859da76f0571611b7a319aa3f47c5cd43bf1519e9fae8fd27b8b')
sha256sums_aarch64=('6a170b51469199c8d05ec00726039648c7e4d4586989d16c2ef2e758e4ac46e8')

package() {
  install -Dm755 "tfschema" "${pkgdir}/usr/bin/tfschema"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
