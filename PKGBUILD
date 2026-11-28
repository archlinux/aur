# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=san-bin
pkgver=1.25.6
pkgrel=1
pkgdesc="Terminal agent runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/genai-io/san"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/genai-io/san/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/san_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/san_linux_arm64.tar.gz")
sha256sums=('8752fcd1c04252a936db90c4285ec655d790c45f790ec6e5766927d052c9912b')
sha256sums_x86_64=('087e09d586e848be6da7124fc599ce84a8ddcaeff1e2708d3a4d76e6e7f46afe')
sha256sums_aarch64=('874ae85a20a16c16946b2571615dd6b19ae63d9123c517e704109ef93694d177')

package() {
  install -Dm755 "san" "${pkgdir}/usr/bin/san"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
