#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=legendofedgar
pkgver=1.21
pkgrel=1
pkgdesc="2D platformer: Venture across the world, battle fearsome creatures and solve puzzles to rescue your father."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/legendofedgar/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'hicolor-icon-theme')
install=legendofedgar.install
source=("https://github.com/riksweeney/edgar/releases/download/${pkgver}/edgar-${pkgver}-1.tar.gz")
md5sums=('89b786bfcf81767a9447ddd397b943d5')

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

