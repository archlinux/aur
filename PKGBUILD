pkgname=nit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal UI for Git (nit) - prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/zGIKS/nit"
license=('MIT')
depends=('git')
provides=('nit')
conflicts=('nit')

source_x86_64=("nit_v${pkgver}_linux_amd64.tar.gz::https://github.com/zGIKS/nit/releases/download/v${pkgver}/nit_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nit_v${pkgver}_linux_arm64.tar.gz::https://github.com/zGIKS/nit/releases/download/v${pkgver}/nit_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5fbf148b6f8625dd913abcebed3bb6c5548640afc28d439611a95dd2ef08c7c8')
sha256sums_aarch64=('8e2ea28ee3201d7a942772f92fd60b2ab28fa02ed9162d85537b5be957094fe4')

package() {
  install -Dm755 "${srcdir}/nit" "${pkgdir}/usr/bin/nit"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
