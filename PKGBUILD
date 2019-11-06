# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=guile-commonmark
pkgver=0.1.2
pkgrel=1
pkgdesc="Guile library for parsing CommonMark"
arch=('any')
url="https://github.com/OrangeShark/guile-commonmark"
license=('LGPL3')
depends=('guile')
source=("https://github.com/OrangeShark/guile-commonmark/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a2ed34bb4bc5d7b33875beff7eb959c0119fa62950c8f9de2c5c59ef85301e47354af3d2b38990802389e6b9c94653b927d380c6918feaeb82099ad92a91bf07')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
