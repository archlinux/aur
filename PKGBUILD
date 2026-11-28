# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-view-serviceaccount-kubeconfig-plugin-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="kubectl plugin that shows a kubeconfig for a service account"
arch=('x86_64' 'aarch64')
url="https://github.com/superbrothers/kubectl-view-serviceaccount-kubeconfig-plugin"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/kubectl-view_serviceaccount_kubeconfig-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/kubectl-view_serviceaccount_kubeconfig-linux-arm64.zip")
sha256sums_x86_64=('18573354d63b718a03842ff0f9e7acde45d082806639109f05d58d332e320788')
sha256sums_aarch64=('195d82686a0af5646922a6e5bdbd9deacda6dedcb864246afb520b303634b0e9')

package() {
  install -Dm755 "kubectl-view_serviceaccount_kubeconfig" "${pkgdir}/usr/bin/kubectl-view_serviceaccount_kubeconfig"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
