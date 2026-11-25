# Maintainer: agony <27015 at riseup dot net>

pkgname=lovable-oj-bin
pkgver=0.4.24
pkgrel=1
pkgdesc='Experimental next generation frontend tooling (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/lovablelabs/oj'
license=('MIT')
depends=('glibc' 'libgcc' 'zlib')
provides=("lovable-oj=${pkgver}")
conflicts=('lovable-oj' 'ojg-git')
_release="${url}/releases/download/v${pkgver}"
source=("lovable-oj-${pkgver}-LICENSE::https://raw.githubusercontent.com/lovablelabs/oj/v${pkgver}/LICENSE")
source_x86_64=("oj-${pkgver}-x86_64.tar.gz::${_release}/oj-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("oj-${pkgver}-aarch64.tar.gz::${_release}/oj-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3cc3fc954c836676b3e485b8af1f9870b8d50b3e3ec4b94b81f5f2ef012cf535')
sha256sums_x86_64=('8b09a542aab62676f9a87cc70d5881603d4bf76bfa5f879673359e69da5c53c3')
sha256sums_aarch64=('ad2c573a9c9196e1069b184071df4d3db0ecf00dcf1607e02afc9bae88ec17ff')

package() {
  install -Dm755 oj -t "${pkgdir}/usr/bin"
  install -Dm644 "lovable-oj-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
