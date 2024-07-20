# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>

_binname="clash"
_pkgname="${_binname}t"
pkgname="${_pkgname}-bin"
pkgver=1.20.1
pkgrel=1
pkgdesc="A rule-based tunnel in Go. Provide you with powerful and fast network functions"
arch=('x86_64' 'x86_64_v3' 'i686' 'aarch64' 'armv5h' 'armv6h' 'armv7h' 'loong64'
      'riscv64' 'mips' 'mipsel' 'mips64' 'mips64el')
url="https://${_pkgname}.drypeng.io/"
_url='https://github.com/DryPeng/clashT'
license=('GPL-3.0-or-later')
optdepends=('clash-geoip: a GeoLite2 data created by MaxMind')
provides=("${_pkgname}" "${_binname}")
conflicts=("${_pkgname}" "${_binname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_binname}.service"
        "README.md-${pkgver}::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.gz::${_url}/releases/download/v${pkgver}/clashT-linux-amd64-v${pkgver}.gz")
source_x86_64_v3=("${_pkgsrc}-x86_64_v3.gz::${_url}/releases/download/v${pkgver}/clashT-linux-amd64-v3-v${pkgver}.gz")
source_i686=("${_pkgsrc}-i686.gz::${_url}/releases/download/v${pkgver}/clashT-linux-386-v${pkgver}.gz")
source_aarch64=("${_pkgsrc}-aarch64.gz::${_url}/releases/download/v${pkgver}/clashT-linux-arm64-v${pkgver}.gz")
source_armv5h=("${_pkgsrc}-armv5h.gz::${_url}/releases/download/v${pkgver}/clashT-linux-armv5-v${pkgver}.gz")
source_armv6h=("${_pkgsrc}-armv6h.gz::${_url}/releases/download/v${pkgver}/clashT-linux-armv6-v${pkgver}.gz")
source_armv7h=("${_pkgsrc}-armv7h.gz::${_url}/releases/download/v${pkgver}/clashT-linux-armv7-v${pkgver}.gz")
source_loong64=("${_pkgsrc}-loong64.gz::${_url}/releases/download/v${pkgver}/clashT-linux-loong64-v${pkgver}.gz")
source_riscv64=("${_pkgsrc}-riscv64.gz::${_url}/releases/download/v${pkgver}/clashT-linux-riscv64-v${pkgver}.gz")
# Change 'hardfloat' to 'softfloat' if necessary
source_mips=("${_pkgsrc}-mips.gz::${_url}/releases/download/v${pkgver}/clashT-linux-mips-hardfloat-v${pkgver}.gz")
source_mipsel=("${_pkgsrc}-mipsel.gz::${_url}/releases/download/v${pkgver}/clashT-linux-mipsle-hardfloat-v${pkgver}.gz")
source_mips64=("${_pkgsrc}-mips64.gz::${_url}/releases/download/v${pkgver}/clashT-linux-mips64-v${pkgver}.gz")
source_mips64el=("${_pkgsrc}-mips64el.gz::${_url}/releases/download/v${pkgver}/clashT-linux-mips64le-v${pkgver}.gz")
sha256sums=('2112a72532fdda187a649c5b35468dbba32d5c4601f36c107f4be202197c6b7a'
            '77afed10d1a8d825522d32cb0e9d6bd7403010ab2d8f26895c4797c2ae81a245'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('53f1639b2378281cd01585bd5e8d85aed28dafeadc42412726d5ccb2dedc18e8')
sha256sums_x86_64_v3=('3274ce13d6e2e4cbe3e9fef2f75f73c201e23c7f4e4d3aeef03859816812f9c1')
sha256sums_i686=('b287b01c31d6a3d0a8c30bd5a6dffe5c8f7a241dac70712d04c0f4620c10ce13')
sha256sums_aarch64=('7fbba42d5cbdef223ba77d85b284c6057f1655b7513aaeb104dc331da0ebce18')
sha256sums_armv5h=('e71628963ca9ce3ced49f9ed54f49b95ebf81d92d163e6d438b6813fa03dec2a')
sha256sums_armv6h=('63e1de91146f502aee4c3bc3a209bf1edcbec2e7b28200bc8fb09736d5fdaad1')
sha256sums_armv7h=('6685f8641f640a029ceff6cab1f18462a4ce7711c632d706bef62dc806763152')
sha256sums_loong64=('120758599f15291f1d47b70f764c1bda200c96b4524294d8abe14e87623d003a')
sha256sums_riscv64=('8f98bd9ee8dc2b8d04be8b66594fe5652f86b6d0ceb25ac665b5f258a5ea0a0e')
sha256sums_mips=('6de4e18f173a429d8b1cf6d9e908118653d277932cc61ed4cb95878dc65790d4')
sha256sums_mipsel=('67ccf75de51ca5ed21bfe588af0574492ae4eecb3d5cd17118e5eb68ad2fdb88')
sha256sums_mips64=('44b9371f15ef987e841f026bd35f651026221e985216642a2b1109247172f555')
sha256sums_mips64el=('fca28d66968b243d0e578fd4537d4e1ccd5156c541460e0c8f3996625a56abcd')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/clash"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_binname}.service" "${pkgdir}/usr/lib/systemd/system/${_binname}.service"
}
