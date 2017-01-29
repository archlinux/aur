# Contributor: megadriver <megadriver at gmx dot com>

pkgname=sz81
pkgver=2.1.7
pkgrel=1
pkgdesc="Sinclair ZX80/ZX81 emulator"
arch=('i686' 'x86_64')
url="http://sz81.sourceforge.net/"
license=("GPL2")
depends=('sdl')
source=(https://downloads.sourceforge.net/sourceforge/sz81/sz81-$pkgver-source.tar.gz
        Makefile.patch)
sha256sums=('4ad530435e37c2cf7261155ec43f1fc9922e00d481cc901b4273f970754144e1'
            '3811139b5921fef0e25be80a453a9a15f5358996b263389dc34320132088a37a')

prepare() {
  cd $pkgname-$pkgver
  patch -p0 -i ../Makefile.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install
}
