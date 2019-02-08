# Contributor: Igor <f2404@yandex.ru>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: aurelien <aurelien@archlinux.org>
# Contributor: Damir <damir@archlinux.org>

pkgname=xtermcontrol
pkgver=3.6
pkgrel=1
pkgdesc="Enables dynamic control of XFree86 xterm properties"
arch=("i686" "x86_64")
url="http://www.thrysoee.dk/xtermcontrol/"
license=("GPL")
depends=('glibc')
source=("https://www.thrysoee.dk/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7fbe4bf129becf360bcf2e3093dfd429ad20cf45698f4e455e0462a37c7f7c05')

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
