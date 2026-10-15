# Maintainer: shbernal <shbernal.01@gmail.com>

_pkgname=mantisbt-cli
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Command line client for the MantisBT REST API'
arch=('x86_64' 'aarch64')
url='https://github.com/overworks/mantisbt-cli'
license=('MIT')
provides=('mantisbt-cli')
conflicts=('mantisbt-cli')
options=('!debug')

source_x86_64=("${_pkgname}-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/mantisbt-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/mantisbt-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('27ef051e0835e91f90168d03ad45aa5f4524065260ebaeac9f95eb17a82af423')
sha256sums_aarch64=('491b1f696b2f08af8bc7cce83ef7d9a47f3f69f187e3a83388267db543474625')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
