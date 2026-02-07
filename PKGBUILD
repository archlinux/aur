# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ksud"
pkgname="${_pkgname}-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc="KernelSU userspace CLI"
arch=(
  'aarch64'
  'x86_64'
)
url="https://kernelsu.org/guide/installation.html#use-the-command-line"
_url="https://github.com/tiann/KernelSU"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'magiskboot'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-musl"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl"
)
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_aarch64=('fc4ccb3af7460400c5a8350044245167200a706cf2ed78088ff61b8c3fc489ee')
sha256sums_x86_64=('5983c2209a3241436a657cf020a5732547cf45e027e865b54147059cd5363fd5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
