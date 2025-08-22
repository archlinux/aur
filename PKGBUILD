# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname="revanced-patches"
pkgver=5.34.0
_target="patches-${pkgver}.rvp"
pkgrel=1
pkgdesc="Official patches maintained by ReVanced"
arch=('any')
url="https://github.com/revanced/${pkgname}"
license=('GPL-3.0-or-later')
depends=()
optdepends=(
  'revanced-cli-bin: apply the patches via CLI'
  'java-runtime>=17: needed to run revanced-cli'
  'revanced-integrations-bin: add-on features for some apps'
)
source=("${url}/releases/download/v${pkgver}/${_target}"
        "${url}/raw/v${pkgver}/"{"README.md","LICENSE"})
noextract=("${_target}")
sha256sums=('316737e3c2c6f7afea360bb6cb473d2c7b99f822bb1b0fba0f426eeeeb987438'
            '6b1d2bac3b03eda03c91b56a080bab91a1af0d9d2ab6248f5579142fbe5df80e'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  cd "${srcdir}"
  install -Dm644 "${_target}" "${pkgdir}/usr/share/revanced/${pkgname}.rvp"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
