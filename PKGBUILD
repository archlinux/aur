# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.11.1
pkgrel=1
pkgdesc="Command line artificial intelligence - Your local LLM context-feeder"

url="https://github.com/baalimago/${_pkgname}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

_pkgsrc="${_pkgname}-${pkgver}"

source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-EXAMPLES.md::${url}/raw/refs/tags/v${pkgver}/examples.md"
        "${_pkgsrc}-PROFILES-CODY.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/cody.json"
        "${_pkgsrc}-PROFILES-GOPHER.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/gopher.json"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
source_i686=("${_pkgsrc}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386")
source_aarch64=("${_pkgsrc}-${arch[2]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
sha256sums=('7c4efa502c087e811d9a3174b7e3060c5ebe39db224ac800fcd58898a916a168'
            '2ec30efcc3800b055179dddc66126a9d4e8917aae8ad8815a560e25dd4a4a61f'
            '81abc6b6ae091984b5defa45e236462099a0f95afd211b5a39c7b70c8926decb'
            '824075343fe6b2f0bda7a627bec99f826e86571fee6c393812315f265d82a741'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('cbc9fb859a11f052c3fc02e478367d8b957c19e05ac44154a2c6806c8ef8cbc1')
sha256sums_i686=('5d8bd8a455d173a0b4b54f6e18e75f6379711b5f9b720ff4dad64aa8a6e67c1c')
sha256sums_aarch64=('cbc9fb859a11f052c3fc02e478367d8b957c19e05ac44154a2c6806c8ef8cbc1')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-EXAMPLES.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
  install -vDm644 "${_pkgsrc}-PROFILES-CODY.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-CODY.json"
  install -vDm644 "${_pkgsrc}-PROFILES-GOPHER.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-GOPHER.json"

  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

