# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmcube
pkgver=0.98
pkgrel=2
pkgdesc="3D objects tumbling about representing CPU load"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/162"
license=('GPL')
depends=('libxpm')
source=("http://dockapps.windowmaker.org/download.php/id/222/$pkgname-$pkgver.tar.gz"
	"$pkgname.patch")
md5sums=('efc6f484c53f0a98a76925a6e1a74cd3'
         '83d0ba27b2122d248123c677e2713e07')

build() {
  cd "$srcdir/$pkgname"
  patch -Np2 -b -z .orig -i "$srcdir/$pkgname.patch"
  cd "$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
