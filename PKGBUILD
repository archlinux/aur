# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=legitify-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="Detect and fix misconfigurations and security risks in GitHub and GitLab assets"
arch=('x86_64' 'aarch64')
url="https://github.com/Legit-Labs/legitify"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/legitify_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/legitify_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('90a8df588c7c2a334c8397ac74b614f411adb8cdf14b6472b7a7cfbe7ef57bdd')
sha256sums_aarch64=('a0d76859fc8f5fe7285d51420b44277eda81501ed226c393083c35290b6c2de2')

package() {
  install -Dm755 "legitify" "${pkgdir}/usr/bin/legitify"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
