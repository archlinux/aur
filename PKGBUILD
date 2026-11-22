# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-watch-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A kubectl plugin to provide a pretty delta change view of being watched Kubernetes resources"
arch=('x86_64' 'aarch64')
url="https://github.com/imuxin/kubectl-watch"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-watch-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-watch-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c3129e4cfc67a2655f0e489e69444179a06ea43ad4d735260a84692256b6ce3b')
sha256sums_aarch64=('0df9551652b374e5f98ba94bc88cbb214090fdde09808e4411f395002334bc3e')

package() {
  install -Dm755 "kubectl-watch" "${pkgdir}/usr/bin/kubectl-watch"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
