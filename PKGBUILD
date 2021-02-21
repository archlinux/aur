#Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=betterww-git
pkgver=1.4.r16.g640a2a4
pkgrel=1
pkgdesc="Modding tool for Wind Waker For Gamecube"
arch=('any')
url="https://github.com/WideBoner/betterww"
license=('MIT')
depends=("python" "pyside2" "python-pyaml" "python-pillow")
install=.INSTALL
source=("git+https://github.com/WideBoner/betterww.git"
	"betterww-launcher")
md5sums=('SKIP'
         'da327ef65dbc01172d1c62812ce117d1')
pkgver() {  
  cd betterww
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g" 
} 

package() {
	mkdir "$pkgdir/opt/"
	mkdir "$pkgdir/usr/"
	mkdir "$pkgdir/usr/bin"
	cp "$srcdir/betterww-launcher" "$pkgdir/usr/bin/"
	cp -r "$srcdir/betterww/" "$pkgdir/opt/"
	chmod 777 -R "$pkgdir/opt/betterww/"
	echo Launch program with \"better-launch\"
}
