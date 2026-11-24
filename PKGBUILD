# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=docker-dash-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="TUI management tool for containers"
arch=('x86_64' 'aarch64')
url="https://github.com/gustavocaso/docker-dash"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gustavocaso/docker-dash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/docker-dash_v${pkgver}_linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/docker-dash_v${pkgver}_linux-arm64")
sha256sums=('70fc0618959704955d05c496a4472f9f7570bdc8ec60a29f5df01aa526dc7ecf')
sha256sums_x86_64=('e56888bb17ba4cdf5aa30b176106326d4014ff6db7637318b49226f133fcac80')
sha256sums_aarch64=('e3fc43efe19a75e9db85cd415acd571aaf8aa595d4f2fa6b1bd9689c9dfc57ac')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/docker-dash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
