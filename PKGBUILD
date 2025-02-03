# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.29.3
pkgrel=1
pkgdesc="Versatile open-source tool for microbiome analysis. https://doi.org/10.7717/peerj.2584"
arch=('x86_64' 'aarch64' 'riscv64' 'powerpc64le')
url="https://github.com/torognes/${_pkgname}"
license=('LGPL-3.0-or-later')
license=('BSD-2-Clause OR GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-aarch64.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-riscv64.tar.gz")
source_powerpc64le=("${_pkgsrc}-powerpc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}-linux-ppc64le.tar.gz")
sha256sums_x86_64=('c86bdfdf84d42b3e7de29b8b62e89bac48db41b86487b41386a273020191f193')
sha256sums_aarch64=('28fc46e787625d2c85566fb066bade3b8dbc26c7703c67a0e0e30a2b3529a0fc')
sha256sums_riscv64=('cbff2ad367cc17fbca6bc7091fd5c5e60fba96dcd3f7e538fbad100064d39dc1')
sha256sums_powerpc64le=('04f5399f09e9a73da05e37a2fc1dc72f06c158c34c93be3a0d9ec06dea4a7c10')

package() {
  cd "${srcdir}/${_pkgsrc}-linux"*
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
