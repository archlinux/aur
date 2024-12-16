# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tex-fmt"
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc="An extremely fast LaTeX formatter written in Rust"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/WGUNDERWOOD/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-armv7hf-linux.tar.gz")
sha256sums=('9a538091093315125aa236a72daab99e584e0c03feb4b17b41e5d3527c0bef50'
            'd909d9843225ff2ccec3a74f3b13c889fb0bfabb7b3801dcad68505a872c941d')
sha256sums_x86_64=('af4b59cd8bd8e7d37f5b73bbb454b34fa1421f693102088e60c5d79f4c4f04c2')
sha256sums_aarch64=('fd07269a4a082046beb3ef708ec687278cb549f8938e9cc93df0514da3501a56')
sha256sums_armv7h=('26af5c7f315f2af5db59abadffdf8510fba29ecd88dfe63da0d877fdcd0a9640')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
