# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="code2prompt"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI tool to convert your codebase into a single LLM prompt"
arch=('x86_64')
url="https://github.com/mufeedvh/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
sha256sums=('d4829c37c25cabdb43ca875f9de1da3733369f91adda4fe939c5ebe6f670d0a0'
            '9d90fff5a2c2de4272d9bc1a30c185b11e0312d9fe229ebc23a923a4c495f78d')
sha256sums_x86_64=('ee913b121e891f66b7019ed2eb669a20b940ecad07e6817b43cdf4342ebbed81')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
