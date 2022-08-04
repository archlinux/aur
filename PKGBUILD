# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=v0.5.2
pkgrel=1
pkgdesc="Curl impersonate libcurl build. Libcurl is a special compilation of curl that makes it impersonate Firefox and Chrome."
url="https://github.com/lwthiker/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=(nss)
provides=(libcurl-impersonate-firefox libcurl-impersonate-chrome)

source_x86_64=(
  "libcurl-impersonate_x86_64.tar.gz::https://github.com/lwthiker/curl-impersonate/releases/download/${pkgver}/libcurl-impersonate-${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "libcurl-impersonate_aarch64.tar.gz::https://github.com/lwthiker/curl-impersonate/releases/download/${pkgver}/libcurl-impersonate-${pkgver}.aarch64-linux-gnu.tar.gz"
)

md5sums_x86_64=('17c7d05478adbf4feba474000172face')
md5sums_aarch64=('e2e0df8341e243e0e704588dea76a016')

package () {
  mkdir -p "${pkgdir}/usr/local/lib/"
  rm libcurl-impersonate*.tar.gz
  install -Dm755 libcurl-impersonate-* "${pkgdir}/usr/local/lib/"
}
