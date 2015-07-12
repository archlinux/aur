# Maintainer: Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Contributor: Ole Roeßler <ole.roessler@gmail.com>

pkgname=logstalgia
pkgver=1.0.5
pkgrel=1
pkgdesc="a website access log visualisation tool"
url="https://github.com/acaudwell/Logstalgia"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('system')
depends=('pcre' 'sdl2_image' 'ftgl' 'glew' 'glm' 'boost' 'libpng')
source=(https://github.com/acaudwell/Logstalgia/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('6cf7fb56c1d2183cdfba9e1349fc429f')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
