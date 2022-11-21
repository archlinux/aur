# Maintainer: Hyperdriveguy <hyperdriveguy@gmail.com>
pkgname=polished-map-plus-plus
pkgver=2.7.1
pkgrel=1
pkgdesc="A map and tileset editor for pokecrystal, pokered, and hacks based on them like Polished Crystal (attributes support)."
arch=('x86_64')
url='https://github.com/Rangi42/polished-map'
license=('LGPL')
depends=('fltk-mod')
makedepends=('git' 'make' 'gcc')
source=("${pkgname}"::'git+https://github.com/Rangi42/polished-map.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  git checkout 2818dc5

  make
}

package() {
  cd "$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
