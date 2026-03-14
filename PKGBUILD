# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="ergo"
pkgname="${_pkgname}-bin"
pkgver=0.7.1
pkgrel=2
pkgdesc="List of utilities for the daily developer workflow"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/beatlabs/${_pkgname}"
license=(
  'BSD-3-Clause'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/readme.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64"
)
source_i686=(
  "${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-386"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64"
)
sha256sums=('e672d1b889936667bae168871a4fbbdacbadf3040513cdea74be9ca491e24f87'
            '39ce0a4556170ecaa5aca48fd0327bbfc022bc6b5e2f4074ca26b24009f6fd1c')
sha256sums_x86_64=('f585abc304683269c1650fdd86c934e062d25674c83264c78deee26229ab77f9')
sha256sums_i686=('8027a674d0a3660b47d18dce893a41e7ccfe2e475d10bec9ab4147cd47a9dcec')
sha256sums_aarch64=('ce330a0b1f962c0fcfe93a0bae17a3105bfd1cd5c2541425cd828b4ac842247b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
