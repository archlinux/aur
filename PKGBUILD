# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=helm-chartsnap-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Snapshot testing for Helm charts"
arch=('x86_64' 'aarch64')
url="https://github.com/jlandowner/helm-chartsnap"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chartsnap_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chartsnap_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fdc950c8dd55db7429e85aa3114ddfc89ce3d6ee8817a233bac566d102af8774')
sha256sums_aarch64=('64836ac4229859c311a1289d23be1335a591e762a68331a8f6fe971221dd2cc7')

package() {
  install -Dm755 "chartsnap" "${pkgdir}/usr/bin/chartsnap"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
