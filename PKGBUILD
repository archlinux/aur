# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Contributor: Ole Roeßler <ole.roessler@gmail.com>

pkgname=logstalgia
pkgver=1.1.2
pkgrel=1
pkgdesc="a website access log visualisation tool"
url="https://github.com/acaudwell/Logstalgia"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('system')
depends=('pcre' 'sdl2_image' 'ftgl' 'glew' 'glm' 'boost' 'libpng')
source=(https://github.com/acaudwell/Logstalgia/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ed3f4081e401f4a509761a7204bdbd7c34f8f1aff9dcb030348885fb3995fca9')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
