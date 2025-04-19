# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.10.2
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=('aarch64' 'armv6h' 'x86_64')
url="https://github.com/mrjackwills/${_pkgname}"
license=('MIT')
depends=('docker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz")
sha256sums=('b1ecc7b01bad48afd4f557f21f755051c13324c7bc517584d0767f7a8a8cba4c'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_aarch64=('5f8d59b2dac0c569ebb8ef9599cf5503635212baf8c6224ee86d6a3d1145061f')
sha256sums_armv6h=('6f73e3eceff95d219be64c18c333c43cb68d3fedc35330677c82fc3e30b4b2f7')
sha256sums_x86_64=('f6e094f535ea942cef95ba20b1dbde8a70a377391fc441b3a863e04a6db61c08')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
