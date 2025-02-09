# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=v0.9.2
pkgrel=1
pkgdesc="Special compilation of libcurl that makes it impersonate Firefox and Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
depends=(nss)
provides=(libcurl-impersonate-firefox libcurl-impersonate-chrome)

source_x86_64=(
  "libcurl-impersonate_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/libcurl-impersonate-${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "libcurl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/libcurl-impersonate-${pkgver}.aarch64-linux-gnu.tar.gz"
)
source_armv7h=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.arm-linux-gnueabihf.tar.gz"
)

md5sums_x86_64=('c767a31ef22b7f07f0865600a1424dc5')
md5sums_aarch64=('82270e24738f92133f4b113308a45b4a')
md5sums_armv7h=('91604b151ff7d746386082aa7c966a76')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  rm libcurl-impersonate*.tar.gz
  cp -a libcurl-impersonate-* "${pkgdir}/usr/lib/"
  chown -R root:root "${pkgdir}/usr/lib/"
}
