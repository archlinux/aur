# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=brutespray-bin
pkgver=2.7.8
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
sha256sums_x86_64=('d01b56ef52d623b026ff31d456c6768417bff5ccd73cdeb82b3254f080a338d6')
sha256sums_aarch64=('726e6b609dc42ff510a9fd01940b326f792f5a037fb361ee20b7860f3216865d')

package() {
  install -Dm755 "brutespray" "${pkgdir}/usr/bin/brutespray"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
