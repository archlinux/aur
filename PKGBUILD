# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nav-ls-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal navigator for interactive ls workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/dkaslovsky/nav"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'nav' 'nav-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dkaslovsky/nav/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/nav_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/nav_linux_arm64")
sha256sums=('a6f749145b4b536bce6e016c4a86b1ac1c7956535be8cc134495d96ffa4231a8')
sha256sums_x86_64=('97a832fa49bd894b42d72a52d2dc8a0a57a68de3e6232c70426b564923e99c8a')
sha256sums_aarch64=('698a5d62f04eb6ed4c8925ec4c248753b831702bf58d2b7c406334d3d0f0684e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nav"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
