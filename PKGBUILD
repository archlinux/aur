# Mantainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=ocrfeeder
pkgname=$_pkgname-git
pkgver=0.8.3+25+g96ed126
pkgrel=1
pkgdesc="complete Optical Character Recognition and Document Analysis and Recognition program"
arch=('any')
url="https://wiki.gnome.org/Apps/OCRFeeder"
license=(GPL)
depends=('ghostscript' 'goocanvas' 'gtk3' 'gtkspell3' 'iso-codes' 'python-gobject' 'python-odfpy'
         'python-pillow' 'python-pyenchant' 'python-reportlab' 'python-sane' 'unpaper')
makedepends=('git' 'gnome-common')
optdepends=('tesseract: character recognition'
            'ocrad: character recognition'
            'gocr: character recognition'
            'cuneiform: character recognition')
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname")
conflicts=($_pkgname)
provides=($_pkgname)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix="/usr"
  make
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
}
