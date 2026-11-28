# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goodls-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="Download shared files and folders from Google Drive"
arch=('x86_64' 'aarch64')
url="https://github.com/tanaikech/goodls"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tanaikech/goodls/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/goodls_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/goodls_linux_arm64")
sha256sums=('5d1734d93d4257cd1b4fcce1df05106048da5ef0929cebdeea8f7c65b98fe222')
sha256sums_x86_64=('c60fbefc793f8c8a4810c7ec6bc1afdcb0b19a20a8f23df0a82c0f4d1bc26b4f')
sha256sums_aarch64=('cdf49b42bc3a5b39313e36931fbf64f7959d07ff6289635600a49a2920e89169')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/goodls"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
