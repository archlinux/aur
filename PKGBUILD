# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.0.0
pkgrel=1
pkgdesc="A CLI tool to extract server certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/Hakky54/certificate-ripper"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_shortname}-${pkgver}-amd64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("${_shortname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-aarch64.tar.gz")
sha256sums_x86_64=(5b637fca3c297d807aeb57390cbbe98945206abe719204f6ecc7d9d1bc563da8)
sha256sums_aarch64=(91d6da8e0b02173bc4881730cf79a48cef5c6521115e8d8d0eedf8ef9b1e0deb)

package() {
  cd "${srcdir}"
  install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
