# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ksud"
pkgname="${_pkgname}-bin"
pkgver=3.2.1
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
sha256sums_aarch64=('94df883b619dd21c1cd2cc5fe0022add64df3361022f67e639a63af1f740c124')
sha256sums_x86_64=('41fca2926b828eab026386d31f7723ac49f67ba21282e850d5fa60b0b32bf67d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
