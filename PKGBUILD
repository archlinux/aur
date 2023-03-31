# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>

pkgname=bbe
pkgver=0.2.2
pkgrel=3
pkgdesc='A sed-like editor for binary files'
arch=('x86_64')
url="https://sourceforge.net/projects/bbe-/?source=directory"
license=('GPL')
depends=('glibc')
source=("https://downloads.sourceforge.net/$pkgname-/$pkgname-$pkgver.tar.gz")
sha256sums=('baaeaf5775a6d9bceb594ea100c8f45a677a0a7d07529fa573ba0842226edddb')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
