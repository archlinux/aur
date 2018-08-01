# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributer: Felix Kauselmann <licorn at gmail dot com>

pkgname=yacreader-nopdf
_pkgname=yacreader
pkgver=9.5.0
pkgrel=1
pkgdesc="A comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'qt5-quickcontrols' 'hicolor-icon-theme' 'glu' 'libunarr')
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin')
source=( "https://github.com/YACReader/${_pkgname}/releases/download/${pkgver}/yacreader-${pkgver}-src.tar.xz" )
sha256sums=('a6f25edb38c5438301b1364464903995d45bae4532a5ebc8d6586f39cdf16533')

build() {
  cd $srcdir/$_pkgname-$pkgver/
  qmake-qt5 CONFIG+=no_pdf
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver/
  make INSTALL_ROOT="$pkgdir" install
}
