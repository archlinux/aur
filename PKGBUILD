# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=node-cert-exporter-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="Prometheus exporter for SSL certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/amimof/node-cert-exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/amimof/node-cert-exporter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/node-cert-exporter-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/node-cert-exporter-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('e5878acbacdc72e16161bbed44e08b6f051a183e85c80f5e435947a8b99061e4')
sha256sums_aarch64=('53c34a888cb5ddee5d1d9c03b74fb077c208ebbeefca98e9b66e806239fbc5ce')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/node-cert-exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
