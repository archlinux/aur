# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=scourge
pkgver=0.21.1
pkgrel=1
pkgdesc="A rogue-like game with a 3d graphical front-end"
arch=('i686' 'x86_64')
url="http://scourgeweb.org"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'libgl' 'mesa')
source=(http://downloads.sourceforge.net/sourceforge/scourge/$pkgname-$pkgver.src.tar.gz http://downloads.sourceforge.net/sourceforge/scourge/$pkgname-$pkgver.data.tar.gz)
md5sums=('ceda87769cde066e3c49ec0836cf19e2' '1da547c79244698d62a973a862b13460')

build() {
  cd $srcdir/scourge
  ./configure --prefix=/usr --with-data-dir=/usr/share/scourge --enable-stencil-buffer
  make || return 1
  make DESTDIR=$pkgdir install
  
  mkdir -p $pkgdir/usr/share/
  mv ../scourge_data $pkgdir/usr/share/scourge
}
