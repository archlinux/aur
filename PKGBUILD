# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=san-bin
pkgver=1.25.5
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
sha256sums_x86_64=('69922a9c6c6bd5a6587e7c24c22874b7c649217a81f4eb96aec46dd263f04743')
sha256sums_aarch64=('f563bcc875f39246f21120a606dd2a5590716b3bedd6990cc15c46c26b4b6933')

package() {
  install -Dm755 "san" "${pkgdir}/usr/bin/san"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
