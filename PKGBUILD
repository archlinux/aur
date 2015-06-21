# Maintainer: revel <revelΘmuub·net>
# Contributor: Paul Ezvan <paul@ezvan.fr>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=jrtplib
pkgver=3.9.1
pkgrel=2
pkgdesc='An object-oriented RTP library written in C++'
arch=('i686' 'x86_64')
url='http://research.edm.uhasselt.be/~jori/page/index.php?n=CS.Jrtplib'
license=('MIT')
#options=('!libtool')
depends=('jthread>=1.3.1')
makedepends=('cmake')
source=("http://research.edm.uhasselt.be/jori/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('97468e1d6765d77c40a6d248f3d6cb83')
sha256sums=('dfd08752e5cc0abae3e2dfbdaf9cf545319128e5bc1add222f782f50a584b20c')

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
