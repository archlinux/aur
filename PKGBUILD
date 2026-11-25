# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nullhub-bin
pkgver=2026.5.29
pkgrel=1
pkgdesc="Management console to install, configure and monitor AI agents and workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/nullclaw/nullhub"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nullclaw/nullhub/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/nullhub-linux-x86_64.bin")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/nullhub-linux-aarch64.bin")
sha256sums=('1981e80520cfb577316838e0dd3616b612de6fefd0313b0a8d8355aaa3be130f')
sha256sums_x86_64=('dd01348a782ab94e6f8104beda746a8b550490149c2d968397995901c5df98ff')
sha256sums_aarch64=('79ce79edff2db60679de8ffa951f6841990dbbe3b3795305ca97f412d2b692a1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nullhub"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
