# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: grimi

pkgname=libxmp
pkgver=4.6.0
pkgrel=0
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('glibc')
options=(!emptydirs)
source=("http://download.sourceforge.net/project/xmp/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2d3c45fe523b50907e89e60f9a3b7f4cc9aab83ec9dbba7743eaffbcdcb35ea6')



build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

