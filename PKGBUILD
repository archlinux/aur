# Contributor: Igor <f2404@yandex.ru>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: aurelien <aurelien@archlinux.org>
# Contributor: Damir <damir@archlinux.org>

pkgname=xtermcontrol
pkgver=3.8
pkgrel=1
pkgdesc="Enables dynamic control of XFree86 xterm properties"
arch=("i686" "x86_64")
url="http://www.thrysoee.dk/xtermcontrol/"
license=("GPL")
depends=('glibc')
source=("https://www.thrysoee.dk/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('561e863620e48cd85a0fd53fddf1b62e930b377f4bde3454806fc541e1b5cf8d')

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
