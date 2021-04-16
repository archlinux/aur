# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=ghorg
pkgver=1.6.0
pkgrel=0
pkgdesc='allows you to quickly clone all of an orgs, or users repos into a single directory.'
arch=('x86_64')
url='https://github.com/gabrie30/ghorg'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabrie30/ghorg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d8d8b952c2ef7f64243dcd41ebe6e31a2ec451f11c77858d584e2146de37864c')
makedepends=('go')

build() {
  cd $pkgname-$pkgver
  go build
}

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/ghorg" "${pkgdir}/usr/bin/ghorg"
}
