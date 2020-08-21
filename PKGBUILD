# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.2.9
pkgrel=1
pkgdesc='Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing'
arch=('x86_64')
url="https://github.com/brentp/${pkgname}"
license=('MIT')
makedepends=('nim' 'nimble' 'htslib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ebbf5a3b1bc0099abf8a8f2df39a37ad279809ba0116d028552ec81a3fed0810')

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
