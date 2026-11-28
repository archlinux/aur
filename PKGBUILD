# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mdsf-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="Format Markdown code blocks using your favorite tools"
arch=('x86_64')
url="https://github.com/hougesen/mdsf"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mdsf-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('adba0ac7765458ac76901fbc9952c7006842ac233ee5565702cfa0aea39cace5')

package() {
  install -Dm755 "mdsf-x86_64-unknown-linux-gnu/mdsf" "${pkgdir}/usr/bin/mdsf"
  install -Dm644 "mdsf-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "mdsf-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
