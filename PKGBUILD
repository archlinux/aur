# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vespasian-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Map API attack surfaces from captured traffic"
arch=('x86_64')
url="https://github.com/praetorian-inc/vespasian"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vespasian_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('887ea6b328f1a33bc02cadb9aa3e1e4526d5e0df2cf057029b335957dddb8248')

package() {
  install -Dm755 "vespasian" "${pkgdir}/usr/bin/vespasian"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
