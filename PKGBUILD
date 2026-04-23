# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname="fcp"
pkgname="${_pkgname}-bin"
pkgver=0.2.1
pkgrel=4
pkgdesc="A significantly faster alternative to the classic Unix cp(1) command"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/svetlitski/${_pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgsrc}-aarch64-unknown-linux-gnu.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgsrc}-x86_64-unknown-linux-gnu.zip"
)
sha256sums=('18d84acfdc7abb33ed18b1c6603f814b4f4c87b583aff5e2670e3339cbe1c590'
            '727c4818487d30563a82a727c3b5893cd959a85042ccba9692d43c952fa67cbb')
sha256sums_aarch64=('2813ad315a87c35bc25c579eddb4884e493ea1b771f62d7ae09f10158acf8e64')
sha256sums_x86_64=('c287303cafff7e6941832950f9b00281eaef0041e0a24eae9c01cd8b2fe5784d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

