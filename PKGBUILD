# Maintainer: SanskritFritz (gmail)

pkgname=toppler-git
pkgver=1.2
pkgrel=1
pkgdesc='A reimplementation of the classic jump & run game "Nebulus"'
arch=('i686' 'x86_64')
url="https://gitlab.com/roever/toppler/"
license=('GPL')
depends=('gcc-libs' 'sdl2_mixer' 'zlib')
source=("git+https://gitlab.com/roever/toppler.git"
        "toppler.desktop")

build() {
  cd "toppler"
  make
}

package() {
  cd "toppler"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/toppler.desktop" "$pkgdir/usr/share/applications/toppler.desktop"
}
md5sums=('SKIP'
         '95f97271fe1f629c396d20bb4d21b924')
