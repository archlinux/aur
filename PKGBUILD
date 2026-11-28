# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ggufy-bin
pkgver=0.8.11
pkgrel=1
pkgdesc="Convert safetensors and GGUF models"
arch=('x86_64')
url="https://github.com/qskousen/ggufy"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/qskousen/ggufy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/ggufy-linux-x86_64.zip")
sha256sums=('71ce060b750115e6a4d3246f8dcb03c45677f5354135c3f9f994be979a16ce9d')
sha256sums_x86_64=('d6124b2114e2568703bfea39855af742b73ede419f62af4b99351517afa3f5dc')

package() {
  install -Dm755 "ggufy" "${pkgdir}/usr/bin/ggufy"
  install -Dm755 "ggufy-gui" "${pkgdir}/usr/bin/ggufy-gui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
