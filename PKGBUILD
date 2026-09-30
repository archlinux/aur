# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=plink2-bin
_pkgname=plink2
pkgver=2.0a7.10
pkgrel=1
pkgdesc="Whole-genome association analysis toolset for large-scale variant data"
arch=('x86_64')
url="https://www.cog-genomics.org/plink/2.0/"
license=('GPL-3.0-or-later' 'custom:Intel Simplified Software License')
provides=("plink2=$pkgver")
conflicts=('plink2')
options=('!strip' '!debug')
source=(
  "https://s3.amazonaws.com/plink2-assets/alpha7/plink2_linux_x86_64_20260929.zip"
)
sha256sums=('671e8d707060ff141ad577a31fc71ef43b96f4dde1ce6e042ebaf27f39c02cc3')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/vcf_subset" "${pkgdir}/usr/bin/vcf_subset"
  install -Dm644 "${srcdir}/intel-simplified-software-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/intel-simplified-software-license.txt"
}
