# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=zint
pkgver=2.4.3
pkgrel=1
pkgdesc="A barcode encoding library supporting over 50 symbologies."
url="http://sourceforge.net/projects/zint/"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('qt4' 'openssl' 'libxext' 'libxrender' 'zlib')
makedepends=('cmake')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('de2f4fd0d008530511f5dea2cff7f96f45df4c029b57431b2411b7e1f3a523e8')

build() {
  cd $srcdir/$pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
