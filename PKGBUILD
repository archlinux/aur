# Maintainer: G. Eyaeb <geyaeb AT elude DOT in>

pkgname=headroom
pkgver=0.4.2.0
pkgrel=1
pkgdesc="Manager for license headers in source code files"
arch=('i686' 'x86_64')
url="https://github.com/vaclavsvejcar/${pkgname}"
license=('BSD')
makedepends=('stack')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c4500187af49cde85d0368e86d5bf0d8fc88feaea68f5db7054c6e4a89c99acd')

build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
