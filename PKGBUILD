pkgname=helpdeco
pkgver=2.1.3
pkgrel=2
pkgdesc="Decompiler for WinHelp (.hlp) files"
arch=('i686' 'x86_64')
license=('GPL')
depends_i686=('glibc')
depends_x86_64=('lib32-glibc')
url="http://sourceforge.net/projects/helpdeco/"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('6ef5dd1a4a397589e5bcdd308820f4d38cbf53e413971231505a998bc1c8003de3b291483743027280ff3113338fc0ed9553066435ee5ffb597da33a487e2638')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CFLAGS="$CFLAGS -m32" LDFLAGS="$LDFLAGS -m32"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix="$pkgdir/usr"
}
