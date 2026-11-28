# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mico-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Migrate Docker containers between servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Ray-D-Song/mico"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Ray-D-Song/mico/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mico_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mico_linux_arm64")
sha256sums=('a14f83d11d3185d2ef3bae490b23a078c68e904c5ec2e7c8911bfed8141cfa6a')
sha256sums_x86_64=('c9c9d2fea3ed6624fd6723ebfac9ae0372e51a65c531ba12776147e0ee3bf5a3')
sha256sums_aarch64=('f8837314b92dbaae95083002b0b6c2a0953ae203b53da218eb7c0a6403bd4a19')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mico"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
