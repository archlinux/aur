# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="flow"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
pkgver=2.0.1
pkgrel=1
pkgdesc="A command-line interface that provides useful utilities for building Flow applications"
arch=('x86_64' 'aarch64')
url="https://docs.onflow.org/flow-cli"
_url="https://github.com/onflow/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('99e8dbba06ffb2d5c2531cc5e09c15ac80b7ee0fb6c18d5e822fdbcf2a48596e')
sha256sums_aarch64=('b7bd9896c2d070cbdaf851cfe1fb872b6fb6df5d30419b895cac2aa2e45e2879')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
