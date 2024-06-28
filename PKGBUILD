# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.6.4
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://github.com/mrjackwills/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'docker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz")
sha256sums=('e864dea58dc1cc58ff4d47aadb653a976dda47fa310bf015ce2955053a00d5a5'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_x86_64=('df76340933c3a75b0ed5e7bb09ced1bb82b690f343be52ae12da18c356c7d977')
sha256sums_aarch64=('2e92633c545abc9f59ba8e992689b5a035f4fd953a672c6c3ed8ebd0aa28f483')
sha256sums_armv6h=('c7c772af60daee360651e41bc6c19ba20298dc93ae53f7d9cfbf0f723c24029e')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
