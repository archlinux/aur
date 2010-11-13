# $Id: PKGBUILD 83924 2010-06-23 18:58:07Z andrea $
# Maintainer:
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu
pkgver=4.1.1
pkgrel=1
pkgdesc="A generic menu for X"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama')
source=("http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz")
md5sums=('931896a199741c23be945e8519a81c1d')

build(){
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install

  #install license
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
