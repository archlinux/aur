# Maintainer: aksr <aksr at t-com dot me>
pkgname=qxw
pkgver=20190909
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
md5sums=('09f2bdec2b168768d9f7053d1e093ae4'
         'affec50cda6e8a0d7f7cab5e28eb643d')
sha1sums=('08f689cfc9d3dc3dfc7ef29a555421b78ffea2ef'
          '71cc3f2cedb5aaa2baa90002b015636f16424c9a')
sha256sums=('88fc1948f8cf10eafd2c40b86ead830e88a88621350fb89b88ab2d0a0e13cef0'
            '2e3ccc61d0d1a039f90b40096312178db1333c9101d4312f5a942596db3c6c71')

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

