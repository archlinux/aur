# Maintainer: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=guile-sdl
pkgver=0.5.2
pkgrel=1
pkgdesc="SDL bindings for Guile Scheme."
url="https://www.gnu.org/software/guile-sdl/"
arch=('any')
license=('GPL3')
depends=('guile' 'sdl2' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("ftp://ftp.gnu.org/gnu/guile-sdl/${pkgname}-${pkgver}.tar.xz")

md5sums=('554c9524fbb1279111716576c65baf14')

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
