# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-jsonschema-bin
pkgver=0.24.1
pkgrel=1
pkgdesc="Generate Go data types from JSON Schema definitions"
arch=('x86_64' 'aarch64')
url="https://github.com/omissis/go-jsonschema"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-jsonschema_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-jsonschema_Linux_arm64.tar.gz")
sha256sums_x86_64=('a486718d9041114449eaf2a422eae46d29337421fee80325a1c481a5126b78c8')
sha256sums_aarch64=('c59b7c04a4f475d9d23c5ce3aaa263b42ee02eb3a21ff044616effa2bfeca9ec')

package() {
  install -Dm755 "go-jsonschema" "${pkgdir}/usr/bin/go-jsonschema"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
