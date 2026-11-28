# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=resend-cli-bin
pkgver=2.30.1
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
sha256sums_x86_64=('19e0b998ea60aaf48de8f198dd4a0743ac6dbb18965e4d138c0183e7953fdf94')
sha256sums_aarch64=('3e42ee1d78c94e81739f94054b5d82830015a263d467cfb0c920f241450dbfb3')

package() {
  install -Dm755 "resend" "${pkgdir}/usr/bin/resend"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
