# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=1.2.0
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

md5sums_x86_64=('58f2cc303e47fd077e551004b740a605')
md5sums_aarch64=('4565a572406038b3cb882a7004a3b4b0')
md5sums_armv7h=('4565a572406038b3cb882a7004a3b4b0')

package () {
  mkdir -p "${pkgdir}/usr/bin/"
  for executable in $(find . -maxdepth 1 -type f -executable)
  do
    install -Dm755 $executable "${pkgdir}/usr/bin/"
  done
}
