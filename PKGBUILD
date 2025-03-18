# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2025_03_06
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
sha256sums_aarch64=('e3b64a4ec80f09f7a31f21b358cdbf430feb5afe91fa10812f33b7268954e89a')
sha256sums_armv7h=('7b37320153276f8c608397ef3b4416b9f7e904a7a3d09b595b84a1242babb5fa')
sha256sums_i686=('064a62177baa98f9eb039be163b3d5d2e46f6af0985beeac07922248a9296230')
sha256sums_powerpc64le=('b2ef3dc4a5bcdbada303fecfbb2aea5eacac0e05a4e0089c0332d7033af5bdea')
sha256sums_riscv64=('7c22604abc2101e8770ff386dc06112b0ef1dc3684c01bb198f620107c48ba53')
sha256sums_x86_64=('14df7c7e494535b31c2d35591ea8c9c78c7508ffbf8754c75c997a701675f4ef')

package() {
  cd "${srcdir}"
  # install -vDm755 "zig" "${pkgdir}/usr/bin/zig"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
