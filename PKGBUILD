# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Rohan Jain <crodjer [@] protonmail [dot] com>

pkgname=babashka-bin
pkgver=1.13.223
pkgrel=1
pkgdesc='A Clojure babashka for the grey areas of Bash.'
arch=('x86_64' 'aarch64')
url='https://github.com/borkdude/babashka'
license=('EPL')
options=(!debug)
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_aarch64=("${pkgname}-${pkgver}-linux-aarch64-static.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64-static.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64-static.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64-static.tar.gz")

sha256sums_x86_64=('115929e904ab5c248e77634766b99df7d6ac00b09fbabfdac52020a322753eed')
sha256sums_aarch64=('052c6051d05bf0342f2265090c1c82dd43309530bdb7b262fa72d79fd6ab5a61')

package() {
  install -Dm755 "${srcdir}/bb" "${pkgdir}/usr/bin/bb"
}
