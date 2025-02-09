# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=v0.9.2
pkgrel=1
pkgdesc="Special compilation of curl that makes it impersonate Firefox and Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
depends=(nss)
provides=(curl-impersonate-chrome)
conflicts=(curl-impersonate-chrome)

source_x86_64=(
  "curl-impersonate_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.aarch64-linux-gnu.tar.gz"
)
source_armv7h=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.arm-linux-gnueabihf.tar.gz"
)

md5sums_x86_64=('8d391919e0fdf618d1dc6ae6fa0f865c')
md5sums_aarch64=('855fec111935d18999014a8a4ad204f1')
md5sums_armv7h=('855fec111935d18999014a8a4ad204f1')

package () {
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 curl_* "${pkgdir}/usr/bin/"
  install -Dm755 curl-impersonate-* "${pkgdir}/usr/bin/"
}
