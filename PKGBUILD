# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=ezthumb
pkgver=3.0.4
pkgrel=1
pkgdesc="A video thumbnail generator based on ffmpeg."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ezthumb/"
license=('GPL3')
depends=('ffmpeg' 'gd' 'gtk2')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('79ca35f6490b17c03e486b474b5304d8')

build() {
  msg "Building libcsoup"
  cd "$srcdir/$pkgname-$pkgver/libcsoup"
  make
  msg "Building ezthumb"
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  make -I "$srcdir/$pkgname-$pkgver/libcsoup"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  install -Dm0755 ezthumb ${pkgdir}/usr/bin/ezthumb
  install -Dm0644 ezthumb.1 ${pkgdir}/usr/share/man/man1/ezthumb.1
}

# vim:set ts=2 sw=2 et:
