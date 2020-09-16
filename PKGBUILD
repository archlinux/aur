# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing'
arch=('x86_64')
url="https://github.com/brentp/${pkgname}"
license=('MIT')
makedepends=('nim' 'nimble' 'htslib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2610e27380225c51897c2882438e7a640e132af0336f0c40a5c4608be5f2bf80')

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
