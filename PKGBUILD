# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=palpo-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Matrix homeserver"
arch=('x86_64')
url="https://github.com/palpo-im/palpo"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'postgresql-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/palpo-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7773ba7908ec934849322af51a5d24e877139006a4f759c4b6865de506e220d1')

package() {
  install -Dm755 "palpo" "${pkgdir}/usr/bin/palpo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
