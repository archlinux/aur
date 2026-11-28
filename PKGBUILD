# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ua3f-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="HTTP(S) rewriting proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/SunBK201/UA3F"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/SunBK201/UA3F/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ua3f-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ua3f-${pkgver}-linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('bb0da6150fd55b839fb5b74b00daa7ae563f4f720a7ae9f35b365345ae130522')
sha256sums_aarch64=('f108caac09600f7727403b245678c9ed997ff105d43a437253e3b46ae75f63d1')

package() {
  install -Dm755 "ua3f" "${pkgdir}/usr/bin/ua3f"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
