# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zot-agent-bin
pkgver=0.4.89
pkgrel=1
pkgdesc="Lightweight coding agent harness"
arch=('x86_64' 'aarch64')
url="https://github.com/patriceckhart/zot"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'zot')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zot_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zot_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('95440f52ce6495bd6b80eef41ae1aa94e3d140c05cb2b0d0e6686520d271b605')
sha256sums_aarch64=('9bdad7cf52d990bf7318c869148935c1605ea54bce87d29e01c00bb813629b11')

package() {
  install -Dm755 "zot" "${pkgdir}/usr/bin/zot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
