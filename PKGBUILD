# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reddit-migrate-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Transfer your Reddit account data between accounts"
arch=('x86_64' 'aarch64')
url="https://github.com/nileshnk/reddit-migrate"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nileshnk/reddit-migrate/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/reddit-migrate-${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/reddit-migrate-${pkgver}-linux-arm64.zip")
sha256sums=('9987753365cabbf5c0358b2adfca39ad69e5a50fc07ae1afe985f7bb827b0787')
sha256sums_x86_64=('46202946540f0ee7f0b20ab9dbb11fa2a5aa19cb61f6fa7726e04ddf09ebdf68')
sha256sums_aarch64=('30f290cb923cee9b46adc5739a93b0d034d99c581d8255b8ef4366d37bbe1dd8')

package() {
  install -Dm755 "reddit-migrate/reddit-migrate" "${pkgdir}/usr/bin/reddit-migrate"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
