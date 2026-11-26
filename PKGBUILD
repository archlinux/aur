# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=resend-cli-bin
pkgver=2.30.0
pkgrel=1
pkgdesc="Command-line interface for the Resend email API"
arch=('x86_64' 'aarch64')
url="https://github.com/resend/resend-cli"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/resend/resend-cli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/resend-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/resend-linux-arm64.tar.gz")
sha256sums=('1959acb1978684aadd7cee9f1510fd9ea31bedac0bc4223de1fe5d2381f300c8')
sha256sums_x86_64=('c18e28aeea30497c6e79feeb041199f88271abeb7149aae71a49ef7e661285a7')
sha256sums_aarch64=('af96f74de741719e4ee00f7a9c3138697b305e0a4d61d642f512799b4f113476')

package() {
  install -Dm755 "resend" "${pkgdir}/usr/bin/resend"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
