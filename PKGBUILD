# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.2.1
pkgrel=2
pkgdesc="Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing"
arch=('any')
url="https://github.com/brentp/mosdepth"
license=('MIT')
makedepends=('nim' 'nimble' 'htslib')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/brentp/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('7aadd0f322a50723a5b396cfe8eb640728be03918a8d41b5a8ab1ba4943c26c6')

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
