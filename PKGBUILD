# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=liqo-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="CLI for Liqo, dynamic and seamless Kubernetes multi-cluster topologies"
arch=('x86_64' 'aarch64')
url="https://github.com/liqotech/liqo"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/liqoctl-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/liqoctl-linux-arm64.tar.gz")
sha256sums_x86_64=('f1f7930bce2c4bb7316a9ab9b3451d4969e7c333dcd5d34b797110f76a20cb21')
sha256sums_aarch64=('ea2c632ef3d025bda14bee550f231a6d150c9f4f7a9c29ece1e2c3658e3e4028')

package() {
  install -Dm755 "liqoctl" "${pkgdir}/usr/bin/liqoctl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
