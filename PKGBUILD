# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rote-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Job scheduler with persistent run history and a live terminal dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/zhh2001/rote"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rote_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rote_Linux_arm64.tar.gz")
sha256sums_x86_64=('c69a189d5b17c0bc67a313163f294e71dfbb74cec680763e7ba748713886b62d')
sha256sums_aarch64=('719fb9cbc836bbaf34e4fc398b72830abb3c2cf3041fe534c2e00138c0ad6e61')

package() {
  install -Dm755 "rote" "${pkgdir}/usr/bin/rote"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
