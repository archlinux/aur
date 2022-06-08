# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=trash-d
pkgver=17
pkgrel=1
pkgdesc="A near drop-in replacement for rm that uses the trash bin. Written in D"
arch=('x86_64')
url="https://github.com/rushsteve1/trash-d"
license=('GPL')
makedepends=(dub dmd)
source=("https://github.com/rushsteve1/trash-d/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('bb5254ebc06d5f9622dd6b4a5335eb9cd6d3fce2a6f1348ef43b6f7ef5d3512bb38151ed09f20c535b7fdefdfcb7c1be5798252bfcd61e39469a4d63b1f69dc5')

build() {
  # Enter the trash-d source folder downloaded from GitHub
  cd "$srcdir/$pkgname-$pkgver"

  # Build using dub
  dub build
}

check() {
  # Enter the trash-d source folder downloaded from GitHub
  cd "$srcdir/$pkgname-$pkgver"

  # Run the tests provided by the developer
  dub test
}

package() {
  # Enter the trash-d source folder downloaded from GitHub
  cd "$srcdir/$pkgname-$pkgver"

  # Install the produced binary
  install -Dm755 "./trash" "${pkgdir}/usr/bin/trash"
}
