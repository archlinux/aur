# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=argocd-lovely-plugin-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Argo CD plugin that combines Helm, Kustomize and other tools"
arch=('x86_64')
url="https://github.com/crumbhole/argocd-lovely-plugin"
license=('BSD-3-Clause')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/argocd-lovely-plugin-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('7f3d3b9cc772c80460de446580d035dd2ca379c97a8c7e9581ab9489fb55947e')

package() {
  install -Dm755 "argocd-lovely-plugin" "${pkgdir}/usr/bin/argocd-lovely-plugin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
