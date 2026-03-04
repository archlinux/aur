# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.13.0
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
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz"
)
source_armv7h=(
  "${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz"
)
sha256sums=('3c6d5ca4c89e0f1820b5717504f560fe91a39d300a0fd9d17ea84b38cee74bb3'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_aarch64=('cda37f07fb012ac7c53107803e606cf5ed2c2c13476461658d8fe6bbc25dca37')
sha256sums_armv7h=('d581aceb4b9f33ced99dc93318e61c532db06f8f3e792b1bb2af51af01a9dc56')
sha256sums_x86_64=('5e02f7f71b3b452a0cf47fedc091c94744615e5a7752a35e0cec8e46dd2b6812')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
