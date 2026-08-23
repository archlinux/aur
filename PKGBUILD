# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.13.4
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/mrjackwills/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'docker'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgname}_${pkgver}_linux_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz"
)
source_armv7h=(
  "${_pkgname}_${pkgver}_linux_armv6.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz"
)
source_x86_64=(
  "${_pkgname}_${pkgver}_linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz"
)
sha256sums=('ae50e9fa5a2d6b44ad4f4e2d077d1b11d90b869171078bd5bca8a816fe7ea0aa'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_aarch64=('850bd6c772df85abb67ab08c2add1e46f663268b8788a4a7184d2ed28fce083b')
sha256sums_armv7h=('ee84e95224a1a6c8b37d861b97e248599d42fbc0fe45c8e2a2d30dc8c125ee1e')
sha256sums_x86_64=('e077cbf2e978a7a6c9802d453491944ba3635482097e2549e58c7e81df389643')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
