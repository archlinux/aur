# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=v0.6.1
pkgrel=1
pkgdesc="Special compilation of libcurl that makes it impersonate Firefox and Chrome"
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

md5sums_x86_64=('bed2142535c209e4a605e03ea014af9d')
md5sums_aarch64=('42cd4834511b78df6ae4737ca17c5282')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  rm libcurl-impersonate*.tar.gz
  cp -a libcurl-impersonate-* "${pkgdir}/usr/lib/"
  chown -R root:root "${pkgdir}/usr/lib/"
}
