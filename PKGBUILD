# Maintainer: Brandon Giesing <brandon@giesing.cf>

pkgname=ttf-roboto-slab
pkgver=r4f5374de05
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
  printf "r$(svn propget git-commit --revprop -r HEAD https://github.com/google/fonts/trunk/apache/robotoslab | cut -c 10)"
}

package() {
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 $srcdir/robotoslab/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 robotoslab/*.ttf $pkgdir/usr/share/fonts/TTF/
}


