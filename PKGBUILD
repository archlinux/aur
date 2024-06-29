# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="code2prompt"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI tool to convert your codebase into a single LLM prompt"
arch=('x86_64')
url="https://github.com/mufeedvh/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
sha256sums=('d4829c37c25cabdb43ca875f9de1da3733369f91adda4fe939c5ebe6f670d0a0'
            '9d90fff5a2c2de4272d9bc1a30c185b11e0312d9fe229ebc23a923a4c495f78d')
sha256sums_x86_64=('ee913b121e891f66b7019ed2eb669a20b940ecad07e6817b43cdf4342ebbed81')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
