# Maintainer: ZwrvKrll <zwrvkrll@gmail.com>
pkgname=qbineditor
pkgver=1.0
pkgrel=1
pkgdesc="Binary file editor written in Qt. Provides HEX, ASCII and BIN views with integrated search."
arch=('x86_64')
url="https://github.com/ZwrvKrll/QBinEditor"
license=('GPL')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('qt5-base' 'qt5-tools' 'gcc' 'make')
source=("git+https://github.com/ZwrvKrll/qbineditor.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 QBinEditor "$pkgdir/usr/bin/QBinEditor"
  install -Dm644 files/QBinEditor.desktop "$pkgdir/usr/share/applications/QBinEditor.desktop"
  install -Dm644 files/QBinEditor.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/QBinEditor.png"
}
