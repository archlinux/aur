# Maintainer: revel <revelΘmuub·net>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=jthread
pkgver=1.3.1
pkgrel=2
pkgdesc='Provides some classes to make use of threads easy on different platforms'
arch=('i686' 'x86_64')
url='http://research.edm.uhasselt.be/~jori/page/index.php?n=CS.Jthread'
license=('MIT')
#options=('!libtool')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://research.edm.uhasselt.be/jori/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3d0a8ce0d8f1507006dccc68f5c50b62')
sha256sums=('faefdaf0465bc459629e7569c5b37c08bd7fe7c061449f44d2a776cc1d892b50')

build() {
  cd "$pkgname-$pkgver"
#  ./configure --prefix=/usr
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIBRARY_INSTALL_DIR:PATH=lib
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
