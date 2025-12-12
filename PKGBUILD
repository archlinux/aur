# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.30.2
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
sha256sums_aarch64=('6c2c9653bcde0937b98af34981e8cf0ce83f08afb75eebfe88f597f03208ac1f')
sha256sums_powerpc64le=('814aa623eccbff968772f7ff2a878dfec2f5d2093087bd7c6cb440e843b28de8')
sha256sums_riscv64=('12097f7021fbc418b26c345d83aeb59560356ab459a66387d38c4d29dcbbdc42')
sha256sums_x86_64=('22bca04bf8a739beb20f7076c143c364a3e50ecf080ce7a471aa28bbe5844c40')

package() {
  cd "${srcdir}/${_pkgsrc}-linux"*
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
