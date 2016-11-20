# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
pkgname=rftg-keldon
pkgdesc="A project to create artificial intelligence opponent(s) for the card game Race for the Galaxy. Currently, the base game and all three expansions are supported."
url="http://www.keldon.net/rftg/"
pkgver=0.9.4
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
# 'fontconfig freetype'
depends=('atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'gtk2' 'harfbuzz' 'libpng' 'pango')
makedepends=()
source=("http://www.keldon.net/rftg/rftg-${pkgver}.tar.bz2")
md5sums=('065255057b1c60d744c3fed2c93d95bb')

build() {
  cd "${srcdir}/rftg-${pkgver}"
  ./configure \
    --prefix=/usr \

  #[[ -d "build" ]] && rm -r "build"
  #mkdir -p "build" && cd "build"
  make
}

package() {
  cd "${srcdir}/rftg-${pkgver}"
  #cd "build"
  make DESTDIR="${pkgdir}" install
}

