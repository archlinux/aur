# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=soba-bin
pkgver=1.5.7
pkgrel=1
pkgdesc="Automated, encrypted backups of Git repositories from many hosting services"
arch=('x86_64' 'aarch64')
url="https://github.com/jonhadfield/soba"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jonhadfield/soba/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/soba_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/soba_linux_arm64.tar.gz")
sha256sums=('159e63eece009f4c313d97d76813cb9eb0f33fb04002e5612f4e7ac1a3c43dc6')
sha256sums_x86_64=('a8921553d89fbfbbd454b0d9417e92d2d1a85a1abe150217cda7e6448304354b')
sha256sums_aarch64=('6ffa3280f2f0f2cf5239cce2b5c9d46c02d61701e03f03654b33390a77366a54')

package() {
  install -Dm755 "soba" "${pkgdir}/usr/bin/soba"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
