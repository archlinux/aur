# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=githooks-bin
pkgver=3.0.6
pkgrel=1
pkgdesc="Per-repository and shared Git hooks with version control and auto-update"
arch=('x86_64' 'aarch64')
url="https://github.com/gabyx/Githooks"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gabyx/Githooks/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/githooks-${pkgver}-linux.amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/githooks-${pkgver}-linux.arm64.tar.gz")
sha256sums=('1686a302b69c88ebc53a9f0fbffe45e4de7604f91e01ada682777855aa67f25a')
sha256sums_x86_64=('d1be9c5703051f24e02422c23ac429396df89b6d41afd090622b39c333676e67')
sha256sums_aarch64=('5907cb1caa1deee7c46ecfa4a097faa3b14be13e1100860c57c1493d615e8873')

package() {
  install -Dm755 "githooks-runner" "${pkgdir}/usr/bin/githooks-runner"
  install -Dm755 "githooks-cli" "${pkgdir}/usr/bin/githooks-cli"
  install -Dm755 "githooks-dialog" "${pkgdir}/usr/bin/githooks-dialog"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
