# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crossdesk-server-bin
pkgver=1.1.40
pkgrel=1
pkgdesc="Relay server for CrossDesk remote desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/kunkundi/crossdesk-server"
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kunkundi/crossdesk-server/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/crossdesk_server-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/crossdesk_server-linux-arm64")
sha256sums=('ea8af5e789cb2d4e9b10bce3874982ade163b749b6bfbdb32e2df21c4d106de1')
sha256sums_x86_64=('f6859687cb3e489b1f95cc93477010c0548a69427380937274fcd96a07926d4c')
sha256sums_aarch64=('29d7e80d6167abb3ee2609e0793a25d7326c9c0c539a7c6c043523b26d5d7042')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/crossdesk_server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
