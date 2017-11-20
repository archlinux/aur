# Maintainer: mastero23 <mastero23 at gmail dot com>

pkgname=lndir
pkgver=1.0.3
pkgrel=1
pkgdesc="Create a shadow directory of symbolic links to another directory tree"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
conflicts=('imake')
source=(http://xorg.freedesktop.org/archive/individual/util/$pkgname-$pkgver.tar.bz2)
md5sums=('a47bcd6cecda1a6ebd3395926ea4f53a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install  
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
