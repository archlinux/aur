# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=qjackrcd
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple QT/JACK recorder"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/qjackrcd/"
license=('GPL')
depends=('qt5-base' 'jack')
source=("https://sourceforge.net/projects/qjackrcd/files/stable/$pkgname-$pkgver.tar.gz")
md5sums=('e2437a9d8ae2f08188ef020d637d3f8a')

build() {
  cd $pkgname-$pkgver
  qmake PREFIX=/usr
  make clean
  make
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/"
}
