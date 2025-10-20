# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=1.2.2
pkgrel=3
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

sha256sums_x86_64=('c36b53a95c82211bf00b193c10f4a5da7abcaf5f6319e13ba689cb3416a40d5c')
sha256sums_aarch64=('9f5fe3a7c350c8eb240cd6470ce9523b38282e1905c571066cf5208b4885ad20')
sha256sums_armv7h=('9f5fe3a7c350c8eb240cd6470ce9523b38282e1905c571066cf5208b4885ad20')

package () {
  mkdir -p "${pkgdir}/usr/bin/"
  for executable in $(find . -maxdepth 1 -type f -executable)
  do
    install -Dm755 $executable "${pkgdir}/usr/bin/"
  done
}
