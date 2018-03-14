# Maintainer: revel <revelΘmuub·net>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=jthread
pkgver=1.3.3
pkgrel=1
pkgdesc='Provides some classes to make use of threads easy on different platforms'
arch=('i686' 'x86_64')
url='http://research.edm.uhasselt.be/jori/page/CS/Jthread.html'
license=('MIT')
#options=('!libtool')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://research.edm.uhasselt.be/jori/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('17560e8f63fa4df11c3712a304ded85870227b2710a2f39692133d354ea0b64f')

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
