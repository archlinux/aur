# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=brutespray-bin
pkgver=2.7.9
pkgrel=1
pkgdesc="Fast, multi-protocol credential brute-forcer"
arch=('x86_64' 'aarch64')
url="https://github.com/x90skysn3k/brutespray"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/brutespray_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/brutespray_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6b8bc9d6a8b3877fe0580c40c03b5f88ac1b8c6766095fb7f13f8f5ad949e484')
sha256sums_aarch64=('c0bbdc7b5b3c1948f89fa23cf59678f14aa0d733364b4cb8c4ac9be9b5a4dc85')

package() {
  install -Dm755 "brutespray" "${pkgdir}/usr/bin/brutespray"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
