# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=k10s-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Clickable Kubernetes TUI with search, logs, exec and port-forwarding"
arch=('x86_64' 'aarch64')
url="https://github.com/p10node/k10s"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/p10node/k10s/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/k10s_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/k10s_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('768e5363a9f3f32e005e6b7f6d1dc80dcb3816725bd69120aeaa2d536b77f281')
sha256sums_x86_64=('c1e62eb672db3c8ffcb0142e36ac8ca5ca6c57baaf5104a2a6933361c0acd868')
sha256sums_aarch64=('fb83a5f310a647421dc3720828ad711b096577d261213862b6cd25cb2971de2b')

package() {
  install -Dm755 "k10s" "${pkgdir}/usr/bin/k10s"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
