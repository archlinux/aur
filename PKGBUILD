# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=libredesk-bin
pkgver=2.9.2
pkgrel=1
pkgdesc="Open-source, self-hosted customer support desk in a single binary"
arch=('x86_64' 'aarch64')
url="https://github.com/abhinavxd/libredesk"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/libredesk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/libredesk_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('aabc2ce549920e4002900104eecb62bda74fbb01420b16593f50354b829b4c6c')
sha256sums_aarch64=('266a03a03e2cff4f5946a002bb78dd6295eeeeb6cde3f5aa92b6d733a57e6b1e')

package() {
  install -Dm755 "libredesk" "${pkgdir}/usr/bin/libredesk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
