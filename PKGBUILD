# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=qjackrcd
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple QT/JACK recorder"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/qjackrcd/"
license=('GPL')
depends=('qt5-base' 'jack')
makedepends=('qt5-tools')
source=("https://github.com/orouits/qjackrcd/archive/v${pkgver}.tar.gz")
md5sums=('b97516da380ca5826fc6029a00bcd277')

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
