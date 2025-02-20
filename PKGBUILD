pkgname=CSVPARSEGUI
pkgver=1.0
pkgrel=1
pkgdesc="Простой CSV парсер на Qt6"
arch=('x86_64')
url="https://github.com/coder6497/CSVParser"
license=('GPL3')
depends=('qt6-base')
makedepends=('qt6-tools' 'make' 'gcc')
source=(
	"main.cpp"
	"widget.cpp"
	"dataresult.cpp"
	"script.cpp"
	"tableshow.cpp"
	"dataresult.h"
	"script.h"
	"widget.h"
	"tableshow.h"
	"dataresult.ui"
	"tableshow.ui"
	"widget.ui"
	"CSVPARSEGUI.pro"
	"appicon.png"
	"csvparsegui.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  cd "$srcdir"
  qmake6 CSVPARSEGUI.pro PREFIX=/usr
  make
}

package() {
  cd "$srcdir"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm755 CSVPARSEGUI "$pkgdir/usr/bin/CSVPARSEGUI"
  install -Dm644 appicon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/appicon.png"
  install -Dm644 csvparsegui.desktop "$pkgdir/usr/share/applications/csvparsegui.desktop"
}
