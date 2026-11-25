# Maintainer: agony <27015 at riseup dot net>

pkgname=lovable-oj-bin
pkgver=0.4.22
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
sha256sums_x86_64=('1f3a65099b7d35bad0a821184f5caa40a45d47b802f813ca4e5b5a6c0f9406d4')
sha256sums_aarch64=('0711a91a5bce592baf2cbe18eeced1248cb4f9d0d1ff4c1c01cf6e8cc8b766b8')

package() {
  install -Dm755 oj -t "${pkgdir}/usr/bin"
  install -Dm644 "lovable-oj-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
