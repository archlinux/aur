# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=oarfish-bin
_pkgname=oarfish
pkgver=0.10.3
pkgrel=1
pkgdesc="A suite of tools for working with long-read transcriptome data (RNA-seq) from PacBio and Oxford Nanopore"
arch=('x86_64')
url="https://github.com/COMBINE-lab/oarfish"
license=('BSD-3-Clause')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=(
  "https://github.com/COMBINE-lab/oarfish/releases/download/v${pkgver}/oarfish-x86_64-unknown-linux-gnu.tar.xz"
  "https://raw.githubusercontent.com/COMBINE-lab/oarfish/v${pkgver}/LICENSE"
)
sha256sums=('ad23cd748ad306ea736e76670d40298ee66704bbcbcb4ddeedb301bfaee57461'
            '54e1dcacaa7246fa5e4decdfce6462843d5a09ac2e2d5a846c02b40f15027d9f')

package() {
  install -Dm755 "${srcdir}/oarfish-x86_64-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
