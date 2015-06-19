# Maintainer: Brandon Giesing <brandon@giesing.cf>

pkgname=ttf-roboto-slab
pkgver=r46d486c
pkgrel=1
pkgdesc='Serif Roboto font from Google Keep'
arch=('any')
license=('APACHE')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('subversion')
source=('svn+https://github.com/google/fonts/trunk/apache/robotoslab')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  printf "r$(git rev-parse --short HEAD)"
}

package() {
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 $srcdir/robotoslab/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 robotoslab/*.ttf $pkgdir/usr/share/fonts/TTF/
}


