# Maintainer: Hyperdriveguy <hyperdriveguy@gmail.com>
pkgname=tilemap-studio
pkgver=3.1.0.1
pkgrel=1
pkgdesc="A tilemap editor for Game Boy, GBC, GBA, or SNES projects."
arch=('x86_64')
url='http://www.fltk.org/'
license=('LGPL')
depends=('fltk-mod')
makedepends=('git' 'make' 'gcc')
source=("${pkgname}"::'git+https://github.com/Rangi42/tilemap-studio.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  git checkout ea79753

  make
}

package() {
  cd "$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
