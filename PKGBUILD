# Maintainer: aksr <aksr at t-com dot me>
pkgname=qxw
pkgver=20140331
pkgrel=1
epoch=
pkgdesc="A program to help you create and publish crosswords."
arch=('i686' 'x86_64')
url="https://www.quinapalus.com/qxw.html"
license=('GPL')
categories=()
groups=()
depends=('gtk2')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://www.quinapalus.com/$pkgname-$pkgver.tar.gz
        https://www.quinapalus.com/$pkgname-guide-$pkgver.pdf)
noextract=()
options=()
md5sums=('745bdc9eb7a05602539f685b0bb8527b'
         '095e1a51e9115567a3f8ee5330742a93')
sha1sums=('3613e0e77b44eeeb7951353aea5f95428bcc8ac5'
          'e0b929745b46b66fa55d9aa3d1d254a4bea013f0')
sha256sums=('c1c61388542151279f62be9ae19ef5f114ecf55469f7815f7aa1c8209648c06b'
            'bdea4a62d0d617782cf1f43ba59b1d3532272dc9dfee9edd9191f05bc763fa07')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's!usr/games!usr/bin!' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../qxw-guide-${pkgver}.pdf $pkgdir/usr/share/doc/$pkgname/qxw-guide-${pkgver}.pdf
}

