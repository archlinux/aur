# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Rohan Jain <crodjer [@] protonmail [dot] com>

pkgname=babashka-bin
pkgver=1.2.174
pkgrel=1
pkgdesc='A Clojure babashka for the grey areas of Bash.'
arch=('x86_64' 'aarch64')
url='https://github.com/borkdude/babashka'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-aarch64-static.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64-static.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64-static.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64-static.tar.gz")

sha256sums_x86_64=('58065366943eedac648d8c51bf72738c7581408bbb2c08077486e2741b3c8fef')
sha256sums_aarch64=('fb1bc33ff8fd3bb841fd845a69828ef632d30854988f05068ba14b9d94ace0ba')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
