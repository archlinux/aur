# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=plink2-bin
_pkgname=plink2
pkgver=2.0a7.4
pkgrel=1
pkgdesc="Whole-genome association analysis toolset for large-scale variant data"
arch=('x86_64')
url="https://www.cog-genomics.org/plink/2.0/"
license=('GPL-3.0-or-later' 'custom:Intel Simplified Software License')
provides=("plink2=$pkgver")
conflicts=('plink2')
options=('!strip' '!debug')
source=(
  "https://s3.amazonaws.com/plink2-assets/alpha7/plink2_linux_x86_64_20260818.zip"
)
sha256sums=('ccd8d129458e88532f9e91faaa5f52dc06dc22255d2501f161bc069019beb807')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/vcf_subset" "${pkgdir}/usr/bin/vcf_subset"
  install -Dm644 "${srcdir}/intel-simplified-software-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/intel-simplified-software-license.txt"
}
