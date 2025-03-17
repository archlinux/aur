pkgname=qtcoldcalc
pkgbase=qtcoldcalc
pkgver=1.0
pkgrel=1
pkgdesk="Простой инженерный калькулятор"
arch=('x86_64')
url="https://github.com/coder6497/coldcalc"
licence=('GPL3')
depence=('gt6-base')
makedepends=('qt6-tools' 'make' 'gcc')
source=(
	"main.cpp"
	"logic.cpp"
	"calcui.cpp"
	"calcui.h"
	"logic.h"
	"calcui.ui"
	"qtcoldcalc.desktop"
	"calcicon.png"
	"qtcoldcalc.pro"
)

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build(){
	cd "$srcdir"
	qmake6 qtcoldcalc.pro PREFIX=/usr
	make
}

package() {
	cd "$srcdir"
	make INSTALL_ROOT="$pkgdir" install 
	install -Dm755 qtcoldcalc "$pkgdir/usr/bin/qtcoldcalc"
       	install -Dm644 calcicon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/calcicon.png"
       	install -Dm644 qtcoldcalc.desktop "$pkgdir/usr/share/applications/qtcoldcalc.desktop"
}
