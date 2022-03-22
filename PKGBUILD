# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=trash-d
pkgver=15
pkgrel=2
pkgdesc="A near drop-in replacement for rm that uses the trash bin. Written in D"
arch=('x86_64')
url="https://github.com/rushsteve1/trash-d"
license=('GPL')
makedepends=(dub dmd)
source=("https://github.com/rushsteve1/trash-d/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f296ec98968ce2de62be8adeb135c5d6610242baa753fe103257fc85206589bce2a71849ef1da8e59a68cbc3b318ab39e02ab8d06b81360b49c2962bc310f041')

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
