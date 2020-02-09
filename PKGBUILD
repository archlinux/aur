# Maintainer: Felix Golatofski <contact@xdfr.de>
pkgname=streamhtmlparser
pkgver=0.1
pkgrel=1
pkgdesc="Implementation of an html and javascript context scanner with no lookahead."
arch=('x86_64')
url="https://github.com/google/streamhtmlparser"
license=('BSD-3-Clause')
depends=()
makedepends=(
  'make'
  'automake'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/streamhtmlparser/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0e6821bba6cac2bf79ad36892689d7ef2a041b7791584a51d4d6c185ba071b6adff006bca94757002790a81e8b3a782df370e3406a518016f110ed522f0b02c8')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
