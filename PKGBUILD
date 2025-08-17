# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mayhem"
pkgname="${_pkgname}-bin"
pkgver=1.2.3
pkgrel=1
pkgdesc="A minimal TUI-based task tracker"
arch=('aarch64' 'x86_64')
url="https://github.com/BOTbkcd/${_pkgname}"
license=('MIT')
depends=('sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
sha256sums_aarch64=('e05db224d4d3c49a8b7669bc667f26831d42d8c717ab7659f9726c816d7da165')
sha256sums_x86_64=('ecb006df4332e64719757dc65b11fcd0b677d511c259fd8d3e9628030c846f2f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
