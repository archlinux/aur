# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.30.4
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
sha256sums_aarch64=('41823e68da1b0c75988dff72ec19c01db91219adcca8645a85d1b722c37d78c0')
sha256sums_powerpc64le=('fa56205284acf7c3ee5b06ad872df5d96da250ec60c7c566872a9d526f1df493')
sha256sums_riscv64=('559573b62de71a406e1511543738d32367353d57588ee0e0b17a54779b730a45')
sha256sums_x86_64=('936ff6858f96dfcecff92adb059d3646c04943c00a280604eaf91f1e58576890')

package() {
  cd "${srcdir}/${_pkgsrc}-linux"*
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
