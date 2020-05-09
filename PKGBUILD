# Maintainer: G. Eyaeb <geyaeb AT elude DOT in>

pkgname=headroom
pkgver=0.2.2.1
pkgrel=1
pkgdesc="Manager for license headers in source code files"
arch=('i686' 'x86_64')
url="https://github.com/vaclavsvejcar/${pkgname}"
license=('BSD')
makedepends=('stack')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0577d9a03f6e44137a42645c945e868a29a96baaf93902ad83c5cdde5a6c1c7d')

build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
