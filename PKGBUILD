# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aizen-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="AI coding agent for your PC or VPS that you can control from your phone"
arch=('x86_64')
url="https://github.com/talmetis-labs/aizen"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/talmetis-labs/aizen/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/aizen-v${pkgver}-linux-x86_64")
sha256sums=('e8d93eb072eb517dc7ecedc269fbfb84a10301ade2aad173ef5280f74ab1e8e5')
sha256sums_x86_64=('8141128e9895b7ed803de5e95882154103b5c0685db8ed90ca4d99d3c0b1c5b1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/aizen"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
