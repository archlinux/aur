# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=open-browser-use-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Real Chrome automation for AI agents via CLI and SDKs"
arch=('x86_64' 'aarch64')
url="https://github.com/iFurySt/open-browser-use"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/iFurySt/open-browser-use/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/open-browser-use-cli-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/open-browser-use-cli-${pkgver}-linux-arm64.tar.gz")
sha256sums=('0fdb775e00e6fdde23984b4f1184cd13c34135caac1e714ad489141c239704bc')
sha256sums_x86_64=('9fdc551631806ef80f0cd219c50f2849e67430a085affac2741de2009a724039')
sha256sums_aarch64=('fc1095d5d5d80a13fe2d0934c519f59bd7d98f710d561b4424e86a308ec74a39')

package() {
  install -Dm755 "open-browser-use" "${pkgdir}/usr/bin/open-browser-use"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
