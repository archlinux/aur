# Maintainer: N.Boughton, <nicholasboughton@gmail.com>
pkgname=swnt
pkgver=0.7.5
pkgrel=1
pkgdesc="Command line GM tools for Stars Without Number"
arch=('x86_64')
url="https://github.com/nboughton/swnt"
license=("MIT")
depends=("git")
makedepends=('go')
optdepends=('hugo: export sectors as hugo sites')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/swnt/archive/v${pkgver}.tar.gz")
sha1sums=('714325463242a3eb981ecb69ea3a859a6926b63f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -v -o swnt
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
