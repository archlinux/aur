# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=immich-kiosk-bin
pkgver=0.48.0
pkgrel=1
pkgdesc="Highly configurable slideshows for displaying Immich assets on browsers and devices"
arch=('x86_64' 'aarch64')
url="https://github.com/damongolding/immich-kiosk"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/immich-kiosk_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/immich-kiosk_Linux_arm64.tar.gz")
sha256sums_x86_64=('643a9038c2b04b7ed56ef017177e8bad5b9a43638d26222b80f5c8270c37402f')
sha256sums_aarch64=('afd42b496917d2d106995e6dc3367a3fc25cd030084ef214917ae2214d54edec')

package() {
  install -Dm755 "immich-kiosk" "${pkgdir}/usr/bin/immich-kiosk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
