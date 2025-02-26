# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Special compilation of curl that makes it impersonate Firefox and Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
depends=(nss)
provides=(curl-impersonate-chrome)
conflicts=(curl-impersonate-chrome)

source_x86_64=(
  "curl-impersonate_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.aarch64-linux-gnu.tar.gz"
)
source_armv7h=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.arm-linux-gnueabihf.tar.gz"
)

md5sums_x86_64=('0754e9d72765400a6e70b449e69cdf98')
md5sums_aarch64=('f733c4b86be48c88a3ecb2c66fca522b')
md5sums_armv7h=('f733c4b86be48c88a3ecb2c66fca522b')

package () {
  mkdir -p "${pkgdir}/usr/bin/"
  for executable in $(find . -maxdepth 1 -type f -name "curl_*" ! -name "*.*")
  do
    install -Dm755 $executable "${pkgdir}/usr/bin/"
  done
  install -Dm755 curl-impersonate-* "${pkgdir}/usr/bin/"
}
