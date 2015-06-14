# Contributor: MCMic <come.bernigaud@laposte.net>


pkgname=meandmyshadow
pkgver=0.4.1
pkgrel=1
pkgdesc="Puzzle/platform game in which you try to reach the exit by solving puzzles"
arch=('i686' 'x86_64')
url="http://meandmyshadow.sourceforge.net/"
license=('GPL3')
depends=('sdl_gfx' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'curl' 'libarchive' 'hicolor-icon-theme' 'libgl')
makedepends=('make' 'cmake')
install="${pkgname}.install"
source=("https://sourceforge.net/projects/meandmyshadow/files/${pkgver}/${pkgname}-${pkgver}-src.tar.gz")
md5sums=('724cb4a1822572dbe04131b5db658d19')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir}
}
