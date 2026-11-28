# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=corvid-lang-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Programming language that checks your AI before it runs"
arch=('x86_64')
url="https://github.com/Micrurus-Ai/Corvid-lang"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/corvid-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d01733d2215eca9d2439c97a21669e66f299180466164815d7055070df82571b')

package() {
  install -Dm755 "corvid-x86_64-unknown-linux-gnu/bin/corvid" "${pkgdir}/usr/bin/corvid"
  install -Dm644 "corvid-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
