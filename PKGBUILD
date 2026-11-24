# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agenttrace-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Audit AI coding agent sessions: cost, tokens, latency and failures"
arch=('x86_64' 'aarch64')
url="https://github.com/luoyuctl/agenttrace"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/luoyuctl/agenttrace/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/agenttrace-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/agenttrace-linux-arm64")
sha256sums=('8df27a8843a00ee6fb604cd381ffef57f5fda4698072d824f98112a9cf0e0439')
sha256sums_x86_64=('3f0159f2eca56717cc5e76a317e495b464fbdc5c9f2610665ef574c6a6d311b6')
sha256sums_aarch64=('e111e5b0a0bde25572b5f2cf335aca1b4bceffc845acdca1f638186a24b6cc41')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/agenttrace"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
