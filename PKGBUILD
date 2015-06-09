# Contributor: megadriver <megadriver at gmx dot com>

pkgname=sz81
pkgver=2.1.7
pkgrel=1
pkgdesc="Sinclair ZX80/ZX81 emulator"
arch=('i686' 'x86_64')
url="http://sz81.sourceforge.net/"
license=("GPL2")
depends=('sdl')
source=(http://downloads.sourceforge.net/sourceforge/sz81/sz81-$pkgver-source.tar.gz
        Makefile.patch)
md5sums=('e0ec83d076793e6275dd58d22139eabe'
         'ee08235fbd63a49b69f8572b01e810b7')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 < $srcdir/Makefile.patch
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=$pkgdir/usr install
}
