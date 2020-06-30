#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=legendofedgar
pkgver=1.33
pkgrel=1
pkgdesc="2D platformer: Venture across the world, battle fearsome creatures and solve puzzles to rescue your father."
arch=('i686' 'x86_64')
url="https://www.parallelrealities.co.uk/games/edgar/"
license=('GPL')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'hicolor-icon-theme')
source=("https://github.com/riksweeney/edgar/archive/${pkgver}.tar.gz")
md5sums=('670e549684918bbc38aafbb0adf41f52')

build() {
  cd "${srcdir}/edgar-${pkgver}"

  sed -e 's|$(PREFIX)/share/games/edgar/|$(PREFIX)/share/edgar/|' -i makefile
  make
}

package()
{
  cd "${srcdir}/edgar-${pkgver}"

  make DESTDIR="${pkgdir}" BIN_DIR="${pkgdir}/usr/bin/" DATA_DIR="${pkgdir}/usr/share/edgar/" install
}

