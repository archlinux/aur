# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=minedmap-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="Minecraft map renderer and viewer"
arch=('x86_64')
url="https://github.com/neocturne/MinedMap"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/neocturne/MinedMap/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/MinedMap-${pkgver}-x86_64-unknown-linux-gnu.zip")
sha256sums=('16a4eb91960d74778a28139ec7747b6de811a5fed0161950376917274e6a0b00')
sha256sums_x86_64=('db2f9978c4c1f1bcf74cbc6b4e37b01f70e9eec4fa261194d0bbc7dcfcfc2e98')

package() {
  install -Dm755 "MinedMap-${pkgver}-x86_64-unknown-linux-gnu/minedmap" "${pkgdir}/usr/bin/minedmap"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
