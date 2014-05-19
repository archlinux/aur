# Maintainer: Julien Savard <juju2143@gmail.com>
pkgname=dunan
pkgver=0.6
pkgrel=2
pkgdesc="Animated 3D MMD models on the desktop"
url="http://frostworx.de/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ftgl' 'libmmd' 'sdl_mixer' 'mesa')
makedepends=('make')
suggests=('ttf-ms-fonts')
conflicts=()
replaces=()
backup=()
install=
source=(http://frostworx.de/dunan/$pkgname-$pkgver.tar.bz2 Makefile.patch)
md5sums=('b9ffe36eb29f33b751413c36b3830d86'
         'dfa88c7adb29a32074dfba546421af1e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < "$startdir/Makefile.patch"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 dunan "$pkgdir/usr/bin/$pkgname"
  install -D -m644 dunan.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 COPYING "$pkgdir/usr/share/doc/$pkgname/COPYING"
  install -D -m644 Changelog "$pkgdir/usr/share/doc/$pkgname/Changelog"
  install -D -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -D -m644 TODO "$pkgdir/usr/share/doc/$pkgname/TODO"
}
