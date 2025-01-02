# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: grimi

pkgname=libxmp
pkgver=4.6.1
pkgrel=1
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('LGPL-2.1-or-later')
depends=('glibc')
options=(!emptydirs)
source=("http://download.sourceforge.net/project/xmp/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('af605e72c83b24abaf03269347e24ebc3fc06cd7b495652a2c619c1f514bc5cb')



build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

