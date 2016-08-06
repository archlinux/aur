# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=libcangjie
pkgver=1.3
pkgrel=1
pkgdesc="CangJie Input Method Library"
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/libcangjie/"
license=('LGPL3')
depends=('sqlite')
makedepends=('pkg-config')  
replaces=('libcangjie-git')
sha256sums=('f4b9a0cf8673f49adb22b675992360799d66eb8d5bce2bd603358de78509d30b')
source=("https://github.com/Cangjians/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
