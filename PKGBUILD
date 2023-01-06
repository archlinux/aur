# Maintainer: Balázs Batári <bayi@bayi.hu>
pkgname=qdmenu
pkgver=v1.0.71.g146bafb
pkgrel=1
pkgdesc="A QML launcher similar to dmenu"
arch=('i686' 'x86_64')
url=https://github.com/bayi/qdmenu
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-svg' 'qt5-location')
makedepends=('git' 'make')
source=("$pkgname::git+https://github.com/bayi/qdmenu.git")
md5sums=('SKIP')
provides=("$pkgname")
conflicts=("$pkgname")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$pkgname"
    qmake
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$srcdir/$pkgname/qdmenu" "$pkgdir/usr/bin/qdmenu"
}
