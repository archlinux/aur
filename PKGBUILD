# Maintainer: Hyperdriveguy <hyperdriveguy@gmail.com>
pkgname=tilemap-studio
pkgver=3.2.0
pkgrel=1
pkgdesc="A tilemap editor for Game Boy, GBC, GBA, or SNES projects."
arch=('x86_64')
url='https://github.com/Rangi42/tilemap-studio'
license=('LGPL')
depends=('fltk-mod')
makedepends=('git' 'make' 'gcc')
source=("${pkgname}"::'git+https://github.com/Rangi42/tilemap-studio.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  git checkout f577f8f

  make
}

package() {
  cd "$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
