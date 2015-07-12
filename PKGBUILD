# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net<
# Contributor: Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Contributor: Ole Roeßler <ole.roessler@gmail.com>

pkgname=logstalgia
pkgver=1.0.6
pkgrel=1
pkgdesc="a website access log visualisation tool"
url="https://github.com/acaudwell/Logstalgia"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('system')
depends=('pcre' 'sdl2_image' 'ftgl' 'glew' 'glm' 'boost' 'libpng')
source=(https://github.com/acaudwell/Logstalgia/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a81b94742cce64b0b2d1b1683f2f7ac6d06456056f353896153b1b8181855f34')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
