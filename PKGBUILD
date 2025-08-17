# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2025_08_13
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
sha256sums=('f3be3ed086f47766a0c361876984a89e4f4c82496dfda6cb82ab8734619563fb')
sha256sums_aarch64=('d732ce1ef4bb2479bc1e64429c3cdc3779953ca34e3cc0848effc546301c04de')
sha256sums_armv7h=('a943aab627093c19c2f0eb405f4dbeed6694970574b1ad2e65639f68a6843d79')
sha256sums_i686=('07bdedf618d48acd6207dfe75c17a3c6acc3d504da78867f48ad3eeae6d5d6b8')
sha256sums_powerpc64le=('616ca7e2692ec9eff64c08e770ea3b586de411aca36f9e6d7325e7317bda89ad')
sha256sums_riscv64=('173102a16f5b9fa1ce03b25ef0cb4a7a5fd868392459673154639b6e637ae960')
sha256sums_x86_64=('49cac16c4621dd52a80e9d94ff190f7320db3bb74959ef207f47fb694bf3b546')

package() {
  cd "${srcdir}"
  # install -vDm755 "zig" "${pkgdir}/usr/bin/zig"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
