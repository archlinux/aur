# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
pkgname=intlfonts
pkgver=1.2.1
pkgrel=4
pkgdesc="Free X11 fonts for all characters that Emacs 20 can handle"
arch=('any')
url="http://directory.fsf.org/wiki/Intlfonts"
license="GPL"
depends=('xorg-font-utils')
install=intlfonts.install
source=(ftp://ftp.gnu.org/pub/gnu/intlfonts/$pkgname-$pkgver.tar.gz)
md5sums=('d77e9c4ec066a985687e5c67992677e4')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-compress --with-type1 --with-truetype
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make fontdir=$pkgdir/usr/share/emacs/fonts install
}
