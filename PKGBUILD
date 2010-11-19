# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu
pkgver=4.2
pkgrel=1
pkgdesc="A generic menu for X"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama')
#source=("http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::http://hg.suckless.org/dmenu/archive/tip.tar.gz")
md5sums=('97bb3ba387928aa667f57ef2a21b8c09')

build(){
#  cd $srcdir/$pkgname-$pkgver
  cd `find $srcdir -type d -name dmenu-\*`
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
#  cd $srcdir/$pkgname-$pkgver
  cd `find $srcdir -type d -name dmenu-\*`
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
