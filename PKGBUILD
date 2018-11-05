# Contributor: Igor <f2404@yandex.ru>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: aurelien <aurelien@archlinux.org>
# Contributor: Damir <damir@archlinux.org>

pkgname=xtermcontrol
pkgver=3.4
pkgrel=1
pkgdesc="Enables dynamic control of XFree86 xterm properties"
arch=("i686" "x86_64")
url="http://www.thrysoee.dk/xtermcontrol/"
license=("GPL")
depends=('glibc')
source=("http://www.thrysoee.dk/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b4e4ffa80b6978c57c48f4a5d18d4cda8c2e42c740262382950f01eb5eda01bd')

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
