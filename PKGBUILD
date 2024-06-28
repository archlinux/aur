# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bluetui"
pkgname="${_pkgname}-bin"
pkgver=0.4
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
source_x86_64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux-gnu")
sha256sums=('86ac8304c42cd2f8aec272a71e2e13a8a341ebe9d147746c6580fbcf71213f8b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('e83dcf07d05e489d06a101ad19242429ff1f8149ba1471d745cb0ac228c27bf8')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "Readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
