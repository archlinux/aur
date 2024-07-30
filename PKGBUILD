# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bluetui"
pkgname="${_pkgname}-bin"
pkgver=0.5.1
pkgrel=1
pkgdesc="TUI for managing bluetooth devices"
arch=('x86_64' 'aarch64')
url="https://github.com/pythops/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'dbus' 'bluez')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/Readme.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux-gnu")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux-gnu")
sha256sums=('33ce653b5c5507cfee5c2b75a6e4083309ae3eef484d1524ca96ae90687c1d76'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('7b9618e9f473079a739e3a9ed0d407a09fb89d3283ed79b48a57e43c00b27aba')
sha256sums_aarch64=('40b2dbe5d6cfbc653758c588c16af14e4b320ba2fa023c4e05a97609806b4de3')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
