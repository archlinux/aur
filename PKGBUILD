# Contributor: Igor <f2404@yandex.ru>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: aurelien <aurelien@archlinux.org>
# Contributor: Damir <damir@archlinux.org>

pkgname=xtermcontrol
pkgver=3.7
pkgrel=1
pkgdesc="Enables dynamic control of XFree86 xterm properties"
arch=("i686" "x86_64")
url="http://www.thrysoee.dk/xtermcontrol/"
license=("GPL")
depends=('glibc')
source=("https://www.thrysoee.dk/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c2396cea504fd338f3ececbfa27c811bc580203577f2b9f16abae8ab5a13a112')

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
