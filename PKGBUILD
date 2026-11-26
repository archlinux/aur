# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xray-checker-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Prometheus exporter for monitoring Xray proxies"
arch=('x86_64' 'aarch64')
url="https://github.com/kutovoys/xray-checker"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kutovoys/xray-checker/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xray-checker-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xray-checker-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('d6267f0685636f7ee91c1671a52b69dc3d4715a6678056455481f5ed7a5afcfc')
sha256sums_aarch64=('05c6dc5836cf64d5de03ee3720d6685ef80937c8f95a0ce4f124cf0ccc834d0a')

package() {
  install -Dm755 "xray-checker" "${pkgdir}/usr/bin/xray-checker"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
