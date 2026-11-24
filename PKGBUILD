# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=k4s-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="kubectl-aware TUI for Kubernetes and k3s that shows the kubectl equivalent of each action"
arch=('x86_64' 'aarch64')
url="https://github.com/lywwkka-ad/k4s"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/k4s_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/k4s_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5f80c07f7915fdf38711650a5366258c2d7f2124d5bc34df3c04032504f427e5')
sha256sums_aarch64=('fd1e19e4bee18eecb3defc545c73a8e5adbe287b92d7b56ad31dcf1cb2df5df2')

package() {
  install -Dm755 "k4s" "${pkgdir}/usr/bin/k4s"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
