# Maintainer: ZwrvKrll <zverevk429@gmail.com>
pkgname=qbineditor
pkgver=1.0
pkgrel=1
pkgdesc="Binary file editor written in Qt. Provides HEX, ASCII and BIN views with integrated search."
arch=('x86_64')
license=('GPL')
depends=(qt5-base qt5-x11extras)
makedepends=(git qt5-base qt5-tools gcc make)
source=(git+https://github.com/ZwrvKrll/qbineditor.git)

build() {
  cd "$pkgname/"
  qmake
  make
}

package() {
  cd "$pkgname"
  install -Dm755 QBinEditor "$pkgdir/QBinEditor"
  install -Dm755 files/QBinEditor.desktop "$pkgdir/QBinEditor.desktop"
  install -Dm755 files/QBinEditor.png "$pkgdir/QBinEditor.png"
}
