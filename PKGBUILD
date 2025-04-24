# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2025_04_24
pkgrel=1
pkgdesc="One zig to rule them all"
arch=('aarch64' 'armv7h' 'i686' 'powerpc64le' 'riscv64' 'x86_64')
url="https://github.com/marler8997/${_pkgname}"
license=('custom:None')
provides=("${_pkgname}") # 'zig' 'zig-nightly'
conflicts=("${_pkgname}") # 'zig'
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md")
        # "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-arm-linux.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86-linux.tar.gz")
source_powerpc64le=("${_pkgsrc}-powerpc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-powerpc64le-linux.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-riscv64-linux.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('dddd8cac6a0825e4671ce3cd1af16ebee155d6b699d2ae5faa1e5c8a10673273')
sha256sums_aarch64=('f496a6679a42f8011b11fd120a794cb4f0cb4d2eadf07e0b6c675e9c25086b6c')
sha256sums_armv7h=('d9ba21890ff1d7a8aba4ea6ae7df988d4c659e42dbc3d64eedb236c29a8a13e2')
sha256sums_i686=('6e9f075d8a6d6aac07718f2a818204d05e42b4b3be8068b51bf212d8c89e588e')
sha256sums_powerpc64le=('b65c900b6e2c1608b6ee247fbaaa7cf337fa58cd1484eaf98dca2ba74492f910')
sha256sums_riscv64=('ad5c46ef584ddd0ab7f4280ad42c2d44a8eec1c9b2d45b6403eeb2fa955ff8f9')
sha256sums_x86_64=('e74040109c668d680fc417c741a8d164c7af546d7c50e15ec228499dfc28672d')

package() {
  cd "${srcdir}"
  # install -vDm755 "zig" "${pkgdir}/usr/bin/zig"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
