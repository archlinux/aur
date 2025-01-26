# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=v0.9.0
pkgrel=1
pkgdesc="Special compilation of curl that makes it impersonate Firefox and Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
depends=(nss)
provides=(curl-impersonate-chrome curl-impersonate-firefox)

source_x86_64=(
  "curl-impersonate_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.aarch64-linux-gnu.tar.gz"
)
source_armv7h=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.arm-linux-gnueabihf.tar.gz"
)

md5sums_x86_64=('25271db8b44d61258c12c36c801cba9c')
md5sums_aarch64=('0585b3f70c485df98e4834103c85bd3a')
md5sums_armv7h=('0585b3f70c485df98e4834103c85bd3a')

package () {
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 curl_* "${pkgdir}/usr/bin/"
  install -Dm755 curl-impersonate-* "${pkgdir}/usr/bin/"
}
