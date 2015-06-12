# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=disktype
pkgver=9
pkgrel=5
pkgdesc="a utility to detect the content format of a disk or disk image"
url="http://disktype.sourceforge.net/"
license=("custom")
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://prdownloads.sourceforge.net/disktype/disktype-9.tar.gz)
md5sums=('25a673f162b9c01cd565109202559489')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin/ $pkgdir/usr/share/man/man1
  gzip $srcdir/$pkgname-$pkgver/disktype.1
  install -D -m755 disktype $pkgdir/usr/bin/
  install -D -m644 disktype.1.gz $pkgdir/usr/share/man/man1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/disktype/LICENSE
}

