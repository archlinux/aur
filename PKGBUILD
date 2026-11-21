# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=plink2-bin
_pkgname=plink2
pkgver=2.0a7.15
pkgrel=1
pkgdesc="Whole-genome association analysis toolset for large-scale variant data"
arch=('x86_64')
url="https://www.cog-genomics.org/plink/2.0/"
license=('GPL-3.0-or-later' 'LicenseRef-Intel-Simplified-Software-License')
provides=("plink2=$pkgver")
conflicts=('plink2')
options=('!strip' '!debug')
source=(
  "https://s3.amazonaws.com/plink2-assets/alpha7/plink2_linux_x86_64_20261107.zip"
)
sha256sums=('8f931c1f5147b53171530ce9f41e4fb1312e7d3e3729c9db7f81c5dd34bb4297')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/vcf_subset" "${pkgdir}/usr/bin/vcf_subset"
  install -Dm644 "${srcdir}/intel-simplified-software-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/intel-simplified-software-license.txt"
}
