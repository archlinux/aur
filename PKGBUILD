# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=nightsky
pkgver=20100829
pkgrel=2
pkgdesc="A basic renderer of the night sky."
arch=(i686 x86_64)
url="http://nightsky.sourceforge.net/"
license=('GPL')
depends=('sdl_image')
install=nightsky.install
source=(http://downloads.sourceforge.net/project/nightsky/$pkgname-$pkgver.tar.gz)
#md5sums=() #generate with 'makepkg -g'
md5sums=('fa2ab06368988678aa14319aa3f07aac')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/-lSDL_image/& -lm/' src/Makefile
  LDFLAGS=" " make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/nightsky"
  install -d "$pkgdir/usr/bin"
  install -m 644 data/* "$pkgdir/usr/share/nightsky/"
  install -m 644 example-nightsky.yml "$pkgdir/usr/share/nightsky/"
  install -m 755 src/nightsky "$pkgdir/usr/bin/nightsky"

}

# vim:set ts=2 sw=2 et:
