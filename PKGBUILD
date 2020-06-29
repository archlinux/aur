# Maintainer: G. Eyaeb <geyaeb AT elude DOT in>

pkgname=headroom
pkgver=0.3.0.0
pkgrel=1
pkgdesc="Manager for license headers in source code files"
arch=('i686' 'x86_64')
url="https://github.com/vaclavsvejcar/${pkgname}"
license=('BSD')
makedepends=('stack')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d9246981dc56bbea9faa2f1edc82f21480208fc9feb79d1c8f25da49b4594f68')

build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
