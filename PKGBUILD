# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=bicep-bin
_name=${pkgname%-bin}
pkgver=0.17.1
pkgrel=2
pkgdesc='A declarative language for describing and deploying Azure resources'
arch=(x86_64)
url='https://github.com/Azure/bicep'
license=(MIT)
provides=($_name)
conflicts=($_name)
depends=(
  gcc-libs
  zlib
)
options=(!strip)

source=(
  "${pkgname}-${pkgver}::https://github.com/Azure/${_name}/releases/download/v${pkgver}/${_name}-linux-x64"
  "LICENSE-${pkgname}-${pkgver}::https://raw.githubusercontent.com/Azure/${_name}/v${pkgver}/LICENSE"
)
sha256sums=(
  '7e1dc4c215dbe5228599719b77d8af776e6e9e491f62b29cd69d76bef1276211'
  'c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383'
)

package() {
  install -Dm644 "LICENSE-${pkgname}-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
}
