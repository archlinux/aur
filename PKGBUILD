# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sslx-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Inspect, grade and manage TLS certificates from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/glincker/sslx"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/glincker/sslx/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sslx-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sslx-linux-aarch64")
sha256sums=('8cd2efd2d2a32bf562c0172171bdf49afe5031d33d2cc3d0672363798f9fa52a')
sha256sums_x86_64=('1b8c0eb88d92794ad440dd76c6a80e5b7f7d49fd34197a3bb96157a42d4db2fd')
sha256sums_aarch64=('0c7273278661e9d53b9b92b4f17cfe88ad500f2f6aaf987c6d00a28cb04045e0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sslx"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
