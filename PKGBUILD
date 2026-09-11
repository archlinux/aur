# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cmd-wrapped"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="Find out what the past year looks like in command line!"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/YiNNx/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-linux.zip::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-linux.zip::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.zip"
)
sha256sums=('a098ee743c8d627e749fc102c3bc4c778f357d8a9ee37f5211fe908066d172af'
            'c0cfd6762582618b55f4ed97f737276b547dc2d2825e631df3db1e27fe591949')
sha256sums_aarch64=('73514dd1485fbce5a49611eaac8c949754cc9bb087627d0b5652c8f9d013135d')
sha256sums_x86_64=('a2e3b7bf34123f5de5ce30b51f5bad9aaff3c9f06b9db4ce8d3f916686c7fb0b')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build"
  install -vDm755 "${_pkgname}-${CARCH}-linux" "${pkgdir}/usr/bin/${_pkgname}"
}
