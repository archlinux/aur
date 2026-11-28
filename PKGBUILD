# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-rexec-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Audited kubectl exec"
arch=('x86_64' 'aarch64')
url="https://github.com/Adyen/kubectl-rexec"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-rexec_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-rexec_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('34e6e18b7aa94444eff7da4843378e483cd93e6246ecaa7eb0e298184e17b568')
sha256sums_aarch64=('497648748fd1ee997c3e253d52e3b28eb6d797a17aacbdf4bf7d2a338ddf8f9c')

package() {
  install -Dm755 "kubectl-rexec" "${pkgdir}/usr/bin/kubectl-rexec"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
