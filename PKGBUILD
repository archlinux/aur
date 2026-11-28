# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=baro-bin
pkgver=0.136.0
pkgrel=1
pkgdesc="Turn a goal into a pull request with concurrent AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/jigjoy-ai/baro"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jigjoy-ai/baro/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/baro-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/baro-linux-arm64")
sha256sums=('765d4188eb0dc15763754c0d0357e1defdeba1417170309816c3390841e79a06')
sha256sums_x86_64=('dc8c5ef86a2989b3d33644682cbb042bd4437ba49932bcc802af8428e1378374')
sha256sums_aarch64=('2d87658ea07e6b273adc0fe254684a9af918b365cc43dc08cba43007a11d6c2d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/baro"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
