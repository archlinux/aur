# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dups-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Find and remove duplicate files using multiple cores and MD5, SHA256 or xxHash"
arch=('x86_64')
url="https://github.com/Navid2zp/dups"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Navid2zp/dups/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/dups_linux_amd64")
sha256sums=('41f48155bfc915eac51bb4c4e2cd37d26cd55839449bd6c5766fcd4bb384aa6e')
sha256sums_x86_64=('0ef5d2c22bbbfd39159a513a52ea82a44bcea0c5d05ebc0d6ec150a98bc2bb93')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dups"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
