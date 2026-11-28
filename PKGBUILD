# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=exitbox-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Run AI agents in complete isolation"
arch=('x86_64' 'aarch64')
url="https://github.com/Cloud-Exit/ExitBox"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Cloud-Exit/ExitBox/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/exitbox-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/exitbox-linux-arm64")
sha256sums=('e9df4c4e4e64b8168a71c3c67668dcffabbe8fca11d4ac4a7d5482562cd1679c')
sha256sums_x86_64=('e791d5b4f87228dedd5d557b7c20a267ffca0967c6b2d19c55e9022ba91555d5')
sha256sums_aarch64=('b7d0ad531578bbe9a6b24b1634a0b6f823b6a81ed0e49c88565d2c74266a843b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/exitbox"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
