# Maintainer: Michel Boucey <michel dot boucey at gmail dot com>
pkgname=dumber
pkgver=3.0.0.3
pkgrel=1
pkgdesc='(un)numbering Mardown sections and add/remove tables of content'
arch=('x86_64')
url="https://github.com/MichelBoucey/$pkgname"
license=('BSD-3-Clause')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('164c01be6584655f6fd051b12bda109cf37ac5923547d5074e0e1be133b13e8b')

build() {
  cd "$pkgname-$pkgver"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/local/bin/${pkgname}"
}
