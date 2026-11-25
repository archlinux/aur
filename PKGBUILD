# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=webp_server_go-bin
pkgver=0.16.2
pkgrel=1
pkgdesc="Go version of WebP Server"
arch=('x86_64' 'aarch64')
url="https://github.com/webp-sh/webp_server_go"
license=('GPL-3.0-only')
depends=('glib2' 'glibc' 'libvips')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/webp-sh/webp_server_go/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/webp-server-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/webp-server-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('4392f87f9960946d7a94b2b6584cd387f7c3237689d7cd7410a784e543c182fc')
sha256sums_aarch64=('1dd000b653a13db944e63b34914f74bf8bb88c40fe824598fd98c982922da872')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/webp-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
