# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=gotify-cli
pkgname="${_pkgname}-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc='Command line interface for pushing messages to gotify server'
arch=('x86_64')
url='https://github.com/gotify/cli'
_rawurl="https://raw.githubusercontent.com/${url##*github.com/}"
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
        "${_pkgname}-${pkgver}-README.md::${_rawurl}/master/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${_rawurl}/master/LICENSE")
sha256sums=('ef7f584b3e253ab4d73cfd602fac5d6ba0fdc4a970c18e5fc3cf560af956e4cd'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
