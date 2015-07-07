# Maintainer: jtts

pkgname=type1inst
pkgver=0.6.1
pkgrel=1
pkgdesc="type1inst is a small perl script which generates the "fonts.scale" file to use any Type 1 PostScript fonts"
url="http://www.freedesktop.org/wiki/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('perl')
makedepends=('gzip')
source=("ftp://sunsite.unc.edu/pub/linux/X11/xutils/${pkgname}-${pkgver}.tar.gz")
md5sums=('86fd885e9877896c51ae6cbe23d89ccf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 t1embed "$pkgdir/usr/bin/t1embed"
  install -Dm755 type1inst "$pkgdir/usr/bin/type1inst"
  gzip type1inst.man
  install -Dm644 type1inst.man.gz "$pkgdir/usr/share/man/man1/type1inst.1.gz"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
