# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.2.3
pkgrel=1
pkgdesc="Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing"
arch=('any')
url="https://github.com/brentp/mosdepth"
license=('MIT')
makedepends=('nim' 'nimble' 'htslib')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/brentp/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('a05b3ef3c779c2155816954322adca2d7c06b3e19a409993020b9ad4bbd28dd4')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  nimble build -y
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
}
