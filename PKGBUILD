# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bluetui"
pkgname="${_pkgname}-bin"
pkgver=0.6
pkgrel=1
pkgdesc="TUI for managing bluetooth devices"
arch=('x86_64' 'aarch64')
url="https://github.com/pythops/${_pkgname}"
license=('GPL-3.0-only')
depends=('bluez' 'dbus' 'gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/Readme.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux-gnu")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux-gnu")
sha256sums=('bf67becacaa094de9571886f574ce50e3199dd63416107118ccf10662a78a978'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('928ec45a182f678c1efecfd1597c7143dadc966de30362b420acd812949d5b56')
sha256sums_aarch64=('9d7feaf4b327942fd2461e442b6b7a04fa5c3f3fd982f041669d1d3f7592cd62')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
