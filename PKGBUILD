# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=nbimg
pkgver=1.2.1
pkgrel=1
pkgdesc="Allows to convert HTC Splash Screen images from NB to BMP and create NB splash screens from BMP format"
arch=('x86_64' 'i686')
url="http://pof.eslack.org/2008/07/03/nbimg-htc-splash-screen-tool/"
license=('GPL3')
source=(https://github.com/poliva/nbimg/archive/v${pkgver}.tar.gz Makefile.patch)
md5sums=('4cff29b5437f909bba470e4f2b0b861b'
         '24fe500b72243ab6d52776583e64fdfa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../Makefile.patch
  make nbimg
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}

# vim:set ts=2 sw=2 et:
