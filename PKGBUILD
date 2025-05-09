# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=fingerprintx
pkgver=1.1.15
pkgrel=1
pkgdesc="Standalone utility for service discovery on open ports!"
arch=('x86_64')
url="https://github.com/praetorian-inc/fingerprintx"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'boost'
  'go'
  'cmake'
  'pkgconfig'
)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('947d46adb4657632fddd1b02f330e0d8aadbf429ddc0d632b8797908b1828805')
options=(!lto)
build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  go build ./cmd/fingerprintx/
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm0755 "./${pkgname}" "${pkgdir}/usr/bin/$pkgname"
}
