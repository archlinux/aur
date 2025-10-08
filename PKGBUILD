# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="rbspy"
pkgname="${_pkgname}-bin"
pkgver=0.38.0
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('aarch64' 'x86_64')
url="https://rbspy.github.io"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'ruby>=1.9.3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/License.md")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('efd80fe8f170fd99b66d575ee1c4de9b3914b2ceff6bb607c1156fe7c88a90d6'
            '5705baf37fec97f83ce5e9624118a3479c4b1ed15f56e168c7f020700331a5df')
sha256sums_aarch64=('c39f69532d6f57df49b0ed9c7bffd8aea27a525bf54b586dda01fe3790bc6c4e')
sha256sums_x86_64=('3378c75cfd8db4ec41fe0b12a304dac973df445c9cad75842653001ffe0e3d2e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
