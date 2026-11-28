# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=keycred-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Generate and manage Active Directory KeyCredentialLinks"
arch=('x86_64' 'aarch64')
url="https://github.com/RedTeamPentesting/keycred"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/keycred_v${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/keycred_v${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('1b71135dd703ed44d47b7077f8eb6adb7cf4b7c029164ed109fd1dbef53be676')
sha256sums_aarch64=('9027551866282375bf91340d0dc00d03c78eef8a6b922633319ec257cc6da4bf')

package() {
  install -Dm755 "keycred" "${pkgdir}/usr/bin/keycred"
  install -Dm755 "pfxtool" "${pkgdir}/usr/bin/pfxtool"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
