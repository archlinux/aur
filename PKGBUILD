# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=xcursor-transparent-theme
pkgver=0.1.1
pkgrel=2
pkgdesc="Completely transparent theme for hiding the X11 cursor"
arch=(any)
url="http://downloads.yoctoproject.org/releases/matchbox/utils/xcursor-transparent-readme.txt"
license=('GPL')
source=("http://downloads.yoctoproject.org/releases/matchbox/utils/xcursor-transparent-theme-0.1.1.tar.gz")
sha1sums=('eab5e65ccab0c6fd4a8e974926127e1e151a6c83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|ln -s \$(DESTDIR)\$(CURSOR_DIR)/transp|ln -s transp|' cursors/Makefile.in
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
