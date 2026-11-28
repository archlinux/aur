# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wrapperr-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Summarize Plex statistics for a period in a web page"
arch=('x86_64' 'aarch64')
url="https://github.com/aunefyren/wrapperr"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/aunefyren/wrapperr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wrapperr--linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wrapperr--linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('1b57bd47ec9bc07fdf15d4a1279ba71496c18690f37c6d7e1f967008a53477eb')
sha256sums_aarch64=('c1633f7a3c13e5925d0b2f56a092e9b3d83cb69306f1850b04104372d8e2a386')

package() {
  install -Dm755 "wrapperr" "${pkgdir}/usr/bin/wrapperr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
