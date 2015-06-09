# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: aurelien <aurelien@archlinux.org>
# Contributor: Damir <damir@archlinux.org>

pkgname=xtermcontrol
pkgver=3.2
pkgrel=1
pkgdesc="Enables dynamic control of XFree86 xterm properties"
arch=("i686" "x86_64")
url="http://www.thrysoee.dk/xtermcontrol/"
license=("GPL")
depends=('glibc')
source=("http://www.thrysoee.dk/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1abf1a8755e0f5c720a69a34f615f8a2')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr \
    --mandir=/usr/share/man
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
