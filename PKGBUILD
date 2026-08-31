# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=manuelschipper
_pkgname=nah
pkgname=nah-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Safety guard that blocks catastrophic coding-agent tool calls before they run'
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
# Upstream ships static musl builds, so there is nothing to link against.
conflicts=('nah')
provides=('nah')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('8626f9b39c0b163ae23d71b3cacdbd7a70d71e756e85e932611c16487f66e869')
sha256sums_aarch64=('8ee87e144799df8f54b589835cea385025f03bd3b911264d14a91b85b2b5fb7c')

package() {
  cd "${srcdir}" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
