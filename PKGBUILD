# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="calories"
pkgname="${_pkgname}-bin"
pkgver=1.1.1
pkgrel=2
pkgdesc="CLI tool for tracking calories and weight using the Harris Benedict formula for calculating your BMR"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/zupzup/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('a4f56000d32f6736afe1a1f4cac89c428d42d18f750a9092edf0d8e65bf527d7')
sha256sums_i686=('11be480d69c36a0592811b6dd8903c680237e280c6e45b7bc1e746262932939d')
sha256sums_x86_64=('37c4052f330779757647df129fa5d2f1261f9597fa1fe1b28c3260c70f558d31')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
