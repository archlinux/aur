# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mayhem"
pkgname="${_pkgname}-bin"
pkgver=1.2.3
pkgrel=1
pkgdesc="A minimal TUI-based task tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/BOTbkcd/${_pkgname}"
license=('MIT')
depends=('sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
sha256sums_x86_64=('ecb006df4332e64719757dc65b11fcd0b677d511c259fd8d3e9628030c846f2f')
sha256sums_aarch64=('e05db224d4d3c49a8b7669bc667f26831d42d8c717ab7659f9726c816d7da165')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}