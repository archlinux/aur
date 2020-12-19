# Maintainer: G. Eyaeb <geyaeb AT elude DOT in>

pkgname=headroom
pkgver=0.3.2.0
pkgrel=1
pkgdesc="Manager for license headers in source code files"
arch=('i686' 'x86_64')
url="https://github.com/vaclavsvejcar/${pkgname}"
license=('BSD')
makedepends=('stack')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5c146728974aa1a65658f1d6764af621012addd36ed5f8462b5fad402f8fd2b8')

build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
