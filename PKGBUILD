# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.3.4
pkgrel=1
pkgdesc='Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing'
arch=('x86_64')
url="https://github.com/brentp/${pkgname}"
license=('MIT')
makedepends=('git' 'nim' 'nimble' 'htslib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('61bfbe0eca68861663edba3f7541e49fcad389bcb097c3e0ae8adf6e4d8161e7')

build() {
  cd "${pkgname}-${pkgver}"

  nimble build -y
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
