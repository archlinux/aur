# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: grimi

pkgname=libxmp
pkgver=4.5.0
pkgrel=4
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('glibc')
options=(!emptydirs !lto)
source=("http://download.sourceforge.net/project/xmp/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7847d262112d14e8442f44e5ac6ed9ddbca54c251284720b563c852b31f26e75')



build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

