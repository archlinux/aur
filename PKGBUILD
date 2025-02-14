# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.29.4
pkgrel=1
pkgdesc="Versatile open-source tool for microbiome analysis. https://doi.org/10.7717/peerj.2584"
arch=('aarch64' 'powerpc64le' 'riscv64' 'x86_64')
url="https://github.com/torognes/${_pkgname}"
license=('LGPL-3.0-or-later')
license=('BSD-2-Clause OR GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-aarch64.tar.gz")
source_powerpc64le=("${_pkgsrc}-powerpc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-ppc64le.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-riscv64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x86_64.tar.gz")
sha256sums_aarch64=('5c7648aa6fd156e99b49cd5a29466ef21a1d56831d6cf4a2759b8b680567a0ef')
sha256sums_powerpc64le=('eed7fe0e8f7664ec609d80ac2a5d9b97264293b22bc75bb53ff4813140ed6271')
sha256sums_riscv64=('fe86e9fee001260df7f134852da8aafc9dbe9d0c2c9e0289205057da3d8a5b50')
sha256sums_x86_64=('9459c3703a03e83d4830b1bacfb4ce269cf0472758057893fb092afadca3ec7d')

package() {
  cd "${srcdir}/${_pkgsrc}-linux"*
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
