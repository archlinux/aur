# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Vinay Shastry <vinayshastry at gmail dot com>

_pkgname=wormhole-william
pkgname=${_pkgname}-bin
pkgver=1.0.4
pkgrel=2
pkgdesc='Securely transfer files between devices. Go implementation of magic wormhole.'
arch=('x86_64')
url='https://github.com/psanford/wormhole-william'
_rawurl="https://raw.githubusercontent.com/${url##*github.com/}"
license=('MIT')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
        "${_pkgname}-${pkgver}-README.md::${_rawurl}/master/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${_rawurl}/master/LICENSE")
sha256sums=('1dbb936fcecdc07e9bd8463e97da282db5c8acee864661ed689a5ce40a64ffdb'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
