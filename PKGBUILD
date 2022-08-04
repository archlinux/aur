# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=v0.5.2
pkgrel=1
pkgdesc="Curl impersonate scripts and executable. Libcurl is a special compilation of curl that makes it impersonate Firefox and Chrome"
url="https://github.com/lwthiker/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=(nss)
provides=(curl-impersonate-chrome curl-impersonate-firefox)

source_x86_64=(
  "curl-impersonate_x86_64.tar.gz::https://github.com/lwthiker/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lwthiker/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.aarch64-linux-gnu.tar.gz"
)

md5sums_x86_64=('540c6ac7e8cb8bdf0a30d424e599143e')
md5sums_aarch64=('c67b509e89c715aae8580c1f3125535c')

package () {
  mkdir -p "${pkgdir}/usr/local/bin/"
  install -Dm755 curl_* "${pkgdir}/usr/local/bin/"
  install -Dm755 curl-impersonate-* "${pkgdir}/usr/local/bin/"
}
