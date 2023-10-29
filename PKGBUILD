# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
# Contributor: daniel <quite a hack org>

pkgname=fim
_pkgver='trunk'
pkgver=0.7
pkgrel=1
pkgdesc='FIM (Fbi IMproved) is a highly customizable and scriptable image viewer.'
arch=('i686' 'x86_64')
url='https://www.nongnu.org/fbi-improved/'
license=('GPL2')
depends=('libexif' 'terminus-font')
optdepends=('aalib: ASCII art support'
            'djvulibre: djvu support'
            'giflib: GIF support'
            'imagemagick: use convert for unrecognized files'
            'libjpeg-turbo: JPEG support'
            'libpng: PNG support'
            'libspectre: postscript support'
            'libtiff: TIFF support'
            'sdl: X support')
source=("http://download.savannah.gnu.org/releases/fbi-improved/${pkgname}-${pkgver}-${_pkgver}.tar.gz")
sha256sums=('fe9edb8de64ce3a0c9390f6c82d79b86436904f8f6449618ddd3178731e73668')

build() {
  cd "${pkgname}-${pkgver}-${_pkgver}"

  ./configure LIBS=-lpthread --prefix=/usr --disable-debug --enable-hardcoded-font

  make
}

package() {
  cd "${pkgname}-${pkgver}-${_pkgver}"

  make DESTDIR=${pkgdir} install
}
