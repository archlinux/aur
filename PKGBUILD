#Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=betterww-git
pkgver=1.4.r16.g640a2a4
pkgrel=5
pkgdesc="Wind Waker Modding Tool for Game Cube"
arch=('any')
url="https://github.com/WideBoner/betterww"
license=('MIT')
depends=("python" "pyside2" "python-pyaml" "python-pillow" "python-pyqt5")
makedepends=("git")
source=("git+https://github.com/WideBoner/betterww.git"
	"betterww-launcher"
	"betterww.desktop"
	"betterww.png")
sha256sums=('SKIP'
            'fcb0134b493d823a8e1299341fd1501237c17b9ac6b4ba0be0cc8072504bd5a2'
            '71d912636a5fcbfbef2147171f79dfb7ccc83d4c37c3601937283349a2ad3cae'
            '2dad518eafe5640eafa2a952324b38098ba2e739c69b23a6be970174695aed74')
pkgver() {  
  cd "$srcdir/betterww"
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g" 
} 

package() {
	mkdir "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/betterww.desktop" "$pkgdir/usr/share/applications/."
	cp "$srcdir/betterww.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/."
	cp "$srcdir/betterww-launcher" "$pkgdir/usr/bin/"
	cp -r "$srcdir/betterww/" "$pkgdir/opt/"
	chmod 777 -R "$pkgdir/opt/betterww/"
}
