# Maintainer: VIVID <vivid@headrat.org>

_pkgname=libg15render
pkgname=$_pkgname-git
pkgver=1.3.0.r0.e432b21
pkgrel=3
pkgdesc="Library to aid in drawing to Logitech G15 screens"
arch=('x86_64')
url="https://github.com/vividnightmare/$_pkgname"
license=('GPL')
depends=('freetype2' 'libg15')
conflicts=('libg15render')
provides=('libg15render')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  chmod +x configure
  ./configure --prefix=/usr --enable-ttf
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
