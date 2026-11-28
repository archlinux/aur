# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-whisper-bin
pkgver=0.0.45
pkgrel=1
pkgdesc="Speech-to-text server and CLI using whisper.cpp"
arch=('x86_64' 'aarch64')
url="https://github.com/mutablelogic/go-whisper"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mutablelogic/go-whisper/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gowhisper-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gowhisper-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('ca557b73c571031d7f023c2359dccf3f23c3f4c073b2d10fd5d3b7b453b5297e')
sha256sums_aarch64=('c87d2ca98c14d4e1c0a9521f8b90eb38193473d2378968d7fd2287f09653bc2f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gowhisper"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
