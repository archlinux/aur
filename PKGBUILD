# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bluetui"
pkgname="${_pkgname}-bin"
pkgver=0.5
pkgrel=1
pkgdesc="TUI for managing bluetooth devices"
arch=('x86_64')
url="https://github.com/pythops/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'dbus' 'bluez')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/Readme.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux-gnu")
sha256sums=('b893abcb4536458d3542e5b4448ae0a026a4e1acda5cbbaa145d5b21f3e4b7c6'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('260db03493f3eb9b56afa9793446436af9fa000dfdffafbdfc1a23aa370d967e')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "Readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
