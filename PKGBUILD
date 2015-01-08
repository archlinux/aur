# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Patrick Burroughs <celticmadman@gmail.com>

pkgname=esetroot
pkgver=20030422
pkgrel=6
pkgdesc="Eterm's root background setter, packaged separately."
url="http://www.eterm.org/"
arch=('i686' 'x86_64')
license=('custom')
depends=('imlib2')
conflicts=('eterm')
source=(https://celti.name/arch/$pkgname-$pkgver.tar.gz)
md5sums=('6a22103b84f6c46f8b18f4ce1222cfc8')

build() {
  cd $pkgname-$pkgver
  make IMLIB_LIBS="$(imlib2-config --libs) -lX11"
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 Esetroot "$pkgdir/usr/bin/Esetroot"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
