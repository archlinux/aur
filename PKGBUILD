# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=primo-bin
pkgver=3.3.2
pkgrel=1
pkgdesc="Build client-editable sites with Claude, Codex, Cursor, or whatever comes next"
arch=('x86_64' 'aarch64')
url="https://github.com/primocms/primo"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/primocms/primo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/primo_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/primo_linux_arm64")
sha256sums=('f4e837ad631806887c27dc45b672abf1f01946b1d8767b2a02b935b31fe3bdfb')
sha256sums_x86_64=('33f67c301695b60516b81ffa8d6982c602887e3a4ad389b6d642be7dc460d002')
sha256sums_aarch64=('f2e9ae38a725190caea552e737080ca0b4ca775cda03f1a72c5630b875fb655a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/primo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
