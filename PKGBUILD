# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cyberstrike-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Open-source AI-powered offensive security harness for automated penetration testing"
arch=('x86_64' 'aarch64')
url="https://github.com/CyberStrikeus/CyberStrike"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/CyberStrikeus/CyberStrike/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cyberstrike-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cyberstrike-linux-arm64.tar.gz")
sha256sums=('3133972dd823488307038fdb262bec9037c4f02af3233e7af128e2f2df952bbb')
sha256sums_x86_64=('694406f0952a90438aa244abb087dc324ef135cc471c57bbb5ef035543f11f75')
sha256sums_aarch64=('843c6fbe58d164b1b2302eef8fc76a1622c210d2d12d6470f13513af66dd2928')

package() {
  install -Dm755 "cyberstrike" "${pkgdir}/usr/bin/cyberstrike"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
