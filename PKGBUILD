# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=trash-d
pkgver=16
pkgrel=1
pkgdesc="A near drop-in replacement for rm that uses the trash bin. Written in D"
arch=('x86_64')
url="https://github.com/rushsteve1/trash-d"
license=('GPL')
makedepends=(dub dmd)
source=("https://github.com/rushsteve1/trash-d/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('51cac3de8f8197afcc0982e48b46e89fc48589274dda705b2e8afee41a450925f776238f5ce6a4bab5283cb87650d0c1486c2fcdb70b8087e004314fddae922d')

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
