# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jimmy-bin
pkgver=1.1.31
pkgrel=1
pkgdesc="Convert notes from many note apps to Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/marph91/jimmy"
license=('GPL-3.0-only')
depends=('zlib' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/marph91/jimmy/v${pkgver}/license")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/jimmy-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/jimmy-linux-aarch64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b586c09f634530d0bd3d346496870930d840901187dc97e7c01b7c3212963a03')
sha256sums_aarch64=('6aaf1a13be9fe1839699ff427a9606a6d3c905d946f4f3547baf60eab57d9aaf')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jimmy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
