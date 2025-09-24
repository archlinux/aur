# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="code2prompt"
pkgname="${_pkgname}-bin"
pkgver=4.0.2
pkgrel=1
pkgdesc="A CLI tool to convert your codebase into a single LLM prompt"
arch=('x86_64')
url="https://github.com/mufeedvh/${_pkgname}"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
sha256sums=('9356587fc1907fff32bb3b16a5bdc461d8f5149b51c4fa7dcb86e470dc69a6a8'
            '9d90fff5a2c2de4272d9bc1a30c185b11e0312d9fe229ebc23a923a4c495f78d')
sha256sums_x86_64=('94a04ee687e0576e550f852e6366cf18bf056ebb0e061274b538185f814ec263')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
