# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: libernux <dutchman55@gmx.com>

pkgname=wmtrash
pkgver=0.2
pkgrel=2
pkgdesc="Simple yet useful trash dockapp"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/266"
license=('GPL')
groups=('x11')
depends=('gtk')
source=(http://dockapps.windowmaker.org/download.php/id/555/$pkgname-$pkgver.tar.gz)
md5sums=(f804a71a5537d1c7373815bbf0cd9b86)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm wmtrash # because there is an old executable in tar-file !!
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 ./conf/* "$pkgdir/usr/share/$pkgname"
}
