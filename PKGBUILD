# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="rbspy"
pkgname="${_pkgname}-bin"
pkgver=0.46.0
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=(
  'aarch64'
  'x86_64'
)
url="https://rbspy.github.io"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'ruby>=1.9.3'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/License.md"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('efd80fe8f170fd99b66d575ee1c4de9b3914b2ceff6bb607c1156fe7c88a90d6'
            '5705baf37fec97f83ce5e9624118a3479c4b1ed15f56e168c7f020700331a5df')
sha256sums_aarch64=('4573ac0f5b2580a414daa6206cd9a1dd2de89717800c53a1c426acaf6bc38683')
sha256sums_x86_64=('1f2e37208714655f10d4dde5b644071f9152648ebde0923752e72318b3a3ff94')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
