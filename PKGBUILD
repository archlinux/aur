# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=cdncheck
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A utility to detect various technology for a given IP address"
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_arm=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
sha256sums_x86_64=('99459178dc8908ff603a0a9306b3801b89e49f808203a5ace8306d6d6ad213aa')
sha256sums_i686=('fb3ab041cdb5b936b8647e6344f8bff5f0d9c2afbe8356a498197edcf122397e')
sha256sums_aarch64=('9295395f069e379f44f025039e0726bd788773fb5337e46673f0e76286adaeb7')
sha256sums_arm=('40df5a65f44c63aada9832248e1e2e7efd811323793564079e0879dd1b348ad0')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
