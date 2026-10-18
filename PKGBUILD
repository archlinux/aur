# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=manuelschipper
_pkgname=nah
pkgname=nah-bin
pkgver=1.7.0
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
sha256sums_x86_64=('e0baa66266e3774d48eeebb6c29b0a9d4de68382f9d3d253febe10970dfd8ac3')
sha256sums_aarch64=('82e387a389a0d1600a113cd0b89a13f94f99fdc2b028e3fcb1ffb3d890d77b50')

package() {
  cd "${srcdir}" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
