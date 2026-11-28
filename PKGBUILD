# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flutter-skill-bin
pkgver=0.9.37
pkgrel=1
pkgdesc="AI-powered end-to-end testing across many platforms"
arch=('x86_64')
url="https://github.com/ai-dashboad/flutter-skill"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ai-dashboad/flutter-skill/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/flutter-skill-linux-x64")
sha256sums=('01cca52a95edbf55834a7cbd5b2961dd2d1e58dc223945bc2b8cb063752c2fec')
sha256sums_x86_64=('452b98986827e4c8e036991a724be32af5add2ad810a883c3b419f375ba8d177')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/flutter-skill"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
