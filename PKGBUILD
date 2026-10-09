# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=plink2-bin
_pkgname=plink2
pkgver=2.0a7.11
pkgrel=1
pkgdesc="Whole-genome association analysis toolset for large-scale variant data"
arch=('x86_64')
url="https://www.cog-genomics.org/plink/2.0/"
license=('GPL-3.0-or-later' 'LicenseRef-Intel-Simplified-Software-License')
provides=("plink2=$pkgver")
conflicts=('plink2')
options=('!strip' '!debug')
source=(
  "https://s3.amazonaws.com/plink2-assets/alpha7/plink2_linux_x86_64_20261001.zip"
)
sha256sums=('c0e64345633dccfd4cfb886dbff720e39e848cf490a51370a659894823a5b2e0')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/vcf_subset" "${pkgdir}/usr/bin/vcf_subset"
  install -Dm644 "${srcdir}/intel-simplified-software-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/intel-simplified-software-license.txt"
}
