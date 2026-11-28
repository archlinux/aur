# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=k8sec-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Manage Kubernetes Secrets easily"
arch=('x86_64' 'aarch64')
url="https://github.com/dtan4/k8sec"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/k8sec_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/k8sec_linux_arm64.tar.gz")
sha256sums_x86_64=('768458a76af177f7e0feb5c221a8ad21611057df76caecf6c42763bdade40fe5')
sha256sums_aarch64=('6a475ce118b919dac8a4d44a69e6a1556f4bc4c7ff1bd98d05768ff483b44ff4')

package() {
  install -Dm755 "k8sec" "${pkgdir}/usr/bin/k8sec"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
