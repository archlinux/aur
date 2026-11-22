# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jdtui-bin
pkgver=1.9.2
pkgrel=1
pkgdesc="A TUI for JDownloader 2 over the My.JDownloader API: downloads, link grabber, accounts"
arch=('x86_64' 'aarch64')
url="https://github.com/rylos/jdtui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rylos/jdtui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jdtui-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jdtui-${pkgver}-aarch64-linux.tar.gz")
sha256sums=('9d92a434674980f6d221eda9ff3514305ac4f6a8735f118c012e62e25aeeb25b')
sha256sums_x86_64=('6735dec287e7f7fbedee599000cccded5953c1e3bd55c5b96287e1b9308bb49d')
sha256sums_aarch64=('b3d41caf5ab19b8c8e98beec13f0a40d8a48b041da32359b2652275e09e7565c')

package() {
  install -Dm755 "jdtui" "${pkgdir}/usr/bin/jdtui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
