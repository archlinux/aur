# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rodney-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Command-line tool for interacting with the web"
arch=('x86_64' 'aarch64')
url="https://github.com/simonw/rodney"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/simonw/rodney/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rodney-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rodney-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('294e260aa0a570f4a07bbeff18bcd5c3e56d21ad561fd124154a6c52b9199a75')
sha256sums_aarch64=('69ca6f2f46b9cf677c89ec9617cc6e721711ca311acb78d9bfa26edb132838d2')

package() {
  install -Dm755 "rodney" "${pkgdir}/usr/bin/rodney"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
