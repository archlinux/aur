# Maintainer:  Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu
pkgver=4.5.git20140225
pkgrel=4
pkgdesc="A generic menu for X"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama')
makedepends=('git')
#source=(http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz)
source=(git://git.suckless.org/dmenu)
md5sums=('SKIP')

build(){
  cd $srcdir/$pkgname
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
