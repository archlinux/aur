# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=podwise-cli-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Command-line client for podwise.ai podcast insights"
arch=('x86_64' 'aarch64')
url="https://github.com/hardhackerlabs/podwise-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/podwise_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/podwise_linux_arm64.tar.gz")
sha256sums_x86_64=('10620defed8a183145d40321522277b39823e23ac38c591ac2e33f52f23f76d4')
sha256sums_aarch64=('0220ef696bf4ee2fc708c18bfa3d760ac26328234cd3e51e9ecf28c7f3ca37ee')

package() {
  install -Dm755 "podwise" "${pkgdir}/usr/bin/podwise"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
