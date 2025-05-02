# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: grimi

pkgname=libxmp
pkgver=4.6.2
pkgrel=2
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('MIT')
depends=('glibc')
options=(!emptydirs)
source=("http://download.sourceforge.net/project/xmp/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('acac1705be2c4fb4d2d70dc05759853ba6aab747a83de576b082784d46f5a4b9')



build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname-$pkgver/docs/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

