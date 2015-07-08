# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=yacreader
pkgver=8.0
pkgrel=1
pkgdesc=('A comic reader for cross-platform reading and managing your digital comic collection.')
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'poppler-qt5' 'qt5-declarative' 'glu' 'libunarr-git' 'desktop-file-utils'  )
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin')
install='yacreader.install'
source=( "https://bitbucket.org/luisangelsm/yacreader/downloads/yacreader-8.0-src.tar.xz" )
md5sums=('6a48980075dee3493b397e87081695be')

build() {
  cd $srcdir/$pkgname-$pkgver/
  qmake-qt5
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make INSTALL_ROOT="$pkgdir" install
}
