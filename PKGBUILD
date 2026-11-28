# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claw-wrap-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Secure credential proxy for CLI tools"
arch=('x86_64' 'aarch64')
url="https://github.com/dedene/claw-wrap"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/claw-wrap_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/claw-wrap_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ad6aa09363b158a285035aff8920207a61cb7f578872ecb3b5934e66e51673e8')
sha256sums_aarch64=('e8cb5fff8a87f71d93850249bc276796490c6f29c1f6cb192a08f2d913279a80')

package() {
  install -Dm755 "claw-wrap" "${pkgdir}/usr/bin/claw-wrap"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
