# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Special compilation of curl that makes it impersonate Firefox and Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
depends=(nss)
provides=(curl-impersonate-chrome curl-impersonate-firefox)
conflicts=(curl-impersonate-chrome curl-impersonate-firefox)

source_x86_64=(
  "curl-impersonate-${pkgver}_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "curl-impersonate-${pkgver}_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.aarch64-linux-gnu.tar.gz"
)
source_armv7h=( 
  "curl-impersonate-${pkgver}_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.arm-linux-gnueabihf.tar.gz"
)

md5sums_x86_64=('78bc05c7333117cbe4e317d895602e96')
md5sums_aarch64=('57eb7f9a9b43adf9bba1754038e079c3')
md5sums_armv7h=('57eb7f9a9b43adf9bba1754038e079c3')

package () {
  mkdir -p "${pkgdir}/usr/bin/"
  for executable in $(find . -maxdepth 1 -type f -executable)
  do
    install -Dm755 $executable "${pkgdir}/usr/bin/"
  done
}
