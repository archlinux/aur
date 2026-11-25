# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rockstar-bin
pkgver=2.0.38
pkgrel=1
pkgdesc="Home of the Rockstar programming language"
arch=('x86_64')
url="https://github.com/RockstarLang/rockstar"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/RockstarLang/rockstar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rockstar-v${pkgver}-linux-x64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('2560dd5312877852fb644680978c55234cfb15566de78ed6b006fb13879e88aa')

package() {
  install -Dm755 "rockstar-linux-x64-binary/rockstar" "${pkgdir}/usr/bin/rockstar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
