# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=yacreader
pkgver=8.5.0
pkgrel=1
pkgdesc="A comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'poppler-qt5' 'qt5-declarative' 'glu' 'libunarr-git' 'desktop-file-utils'  'qt5-quickcontrols')
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin')
install='yacreader.install'
source=( "https://bitbucket.org/luisangelsm/yacreader/downloads/yacreader-${pkgver}-src.tar.xz" )
sha256sums=('dfb6aa3c8f5971f85971123efb3322df77fbd40014025a8568e8337e1505d01d')

build() {
  cd $srcdir/$pkgname-$pkgver/
  qmake-qt5
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make INSTALL_ROOT="$pkgdir" install
}
