# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gowrap-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Generate decorators for Go interfaces"
arch=('x86_64' 'aarch64')
url="https://github.com/hexdigest/gowrap"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gowrap_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gowrap_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2e768b23ae7406f064faa7d774756ebc5b7fd088276378f6c0f10f8bf99f3d77')
sha256sums_aarch64=('bb02fc6cfbb8df2cef65a091f5212e6cfb086baf371d5b8ae5809e5c724257a9')

package() {
  install -Dm755 "gowrap" "${pkgdir}/usr/bin/gowrap"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
