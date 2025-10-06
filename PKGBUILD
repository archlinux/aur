# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.30.1
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
sha256sums_aarch64=('2ee50e8092718a504215dbd417e2fdacaca49adacd2b227908bada72a15ec241')
sha256sums_powerpc64le=('585f88dd6bb6aae6c41b8e364b5b0caaaf4a775c679fa5929a54a887e40317b9')
sha256sums_riscv64=('495d0acdcfeeb1378c234f92e23672f7278b88d48b8aaa1bb21e2bf6ffcf7ebc')
sha256sums_x86_64=('d451d2c5ed12f09e92e4d0cd9ad3043a1be935a39838c8270d3269f8b8f81f7d')

package() {
  cd "${srcdir}/${_pkgsrc}-linux"*
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
