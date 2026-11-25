# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=donetick-bin
pkgver=0.1.89
pkgrel=1
pkgdesc="Donetick an open-source, user-friendly app for managing tasks and chores, featuring customizable options to help you and others stay organized"
arch=('x86_64' 'aarch64')
url="https://github.com/donetick/donetick"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/donetick/donetick/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/donetick_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/donetick_Linux_arm64.tar.gz")
sha256sums=('20b067f86de375aae6db0f283ab2e65de24d537733b89bd58432c101259d84cf')
sha256sums_x86_64=('fea117709f29fd354c37fea09c707a9b134b58eff15825cbcf66acc02c42f90b')
sha256sums_aarch64=('32bb87130af5cc4982b0c5b71de77ff8b1914b7bd6b8fdde3a7c3c68c57846e9')

package() {
  install -Dm755 "donetick" "${pkgdir}/usr/bin/donetick"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
