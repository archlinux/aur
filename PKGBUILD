# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="Special compilation of libcurl that makes it impersonate Firefox and Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
depends=(nss)
provides=(libcurl-impersonate-firefox libcurl-impersonate-chrome)

source_x86_64=(
  "libcurl-impersonate_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "libcurl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.aarch64-linux-gnu.tar.gz"
)
source_armv7h=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.arm-linux-gnueabihf.tar.gz"
)

md5sums_x86_64=('01247ea1a6723265b7127f13f0108b87')
md5sums_aarch64=('3fe23db3327b088be0afdbb114dcfa57')
md5sums_armv7h=('b7e89c1d8087f051ffad1270ab8a1d60')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  rm libcurl-impersonate*.tar.gz
  cp -a libcurl-impersonate-* "${pkgdir}/usr/lib/"
  chown -R root:root "${pkgdir}/usr/lib/"
}
