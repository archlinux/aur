# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=aeskeyfind
pkgver=1.0
pkgrel=2
pkgdesc='automatic techniques for locating 128-bit and 256-bit AES keys in a captured memory image'
arch=('i686' 'x86_64')
url='https://citp.princeton.edu/research/memory/'
license=('GPL')
depends=(glibc)
makedepends=()
# source=(https://citp.princeton.edu/memory-content/src/$pkgname-$pkgver.tar.gz)
source=(https://raw.githubusercontent.com/DonnchaC/coldboot-attacks/master/aeskeyfind-${pkgver}.tar.gz{,.asc})
sha256sums=('1417e5c1b61e86bb9527db1f5bee1995a0eea82475db3cbc880e04bf706083e4'
            'SKIP')
validpgpkeys=(12E404FFD3C931F934052D06B8841A919D0FACE4) # Jacob Appelbaum <jacob@appelbaum.net>
build(){
  cd "$srcdir"/$pkgname
  make
}
package(){
  cd "$srcdir"/$pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
