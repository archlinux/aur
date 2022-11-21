# Maintainer: Hyperdriveguy <hyperdriveguy@gmail.com>
pkgname=tilemap-studio
pkgver=4.0.1
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
  git checkout 20f6a83

  make
}

package() {
  cd "$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
