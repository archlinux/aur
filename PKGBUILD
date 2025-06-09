# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2025_06_07
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
sha256sums_aarch64=('cffd21e20c167871cfb6f7a316cf78aa1f0afbb179751dcb333b807a65104e00')
sha256sums_armv7h=('fa8a397a428c193daef286f50338731d370ec975ae51c6972c847d4512a54890')
sha256sums_i686=('ed08e3b0f2690686f83cc62b153e77f93790def762ab82eaf1df1346371504d9')
sha256sums_powerpc64le=('33b51caf8b804c567b07459d80a062949edf9a88a90bc9f0eecfcbc724fd889f')
sha256sums_riscv64=('f5f44792a46ab85c88fda18e1bc25549351da359f64a2b0d7e91b9065c00964c')
sha256sums_x86_64=('ed0d20a8059d595dd290d3f94b3bee79490773df786861e5440b9908f0d6029d')

package() {
  cd "${srcdir}"
  # install -vDm755 "zig" "${pkgdir}/usr/bin/zig"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
