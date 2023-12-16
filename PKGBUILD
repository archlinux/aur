#Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=betterww-git
pkgver=r1313.68513b2
pkgrel=1
epoch=1
pkgdesc="Wind Waker Modding Tool for Game Cube"
arch=('any')
url="https://github.com/WideBoner/betterww"
license=('MIT')
depends=("python" "pyside2" "python-pyaml" "python-pillow" "python-pyqt5")
makedepends=("git")
source=("git+https://github.com/WideBoner/betterww.git"
	"betterww-launcher"
	"betterww.desktop"
	"betterww.png"
	"LICENSE")
sha512sums=('SKIP'
            'e953a7e4bff3c05a2ca76de7e155225f889cfdc4014ce97e7166d67cb74adb5f0b09425ea00f7d567f407272c2d62375aa8a17bfa1c4f841c33a8f6c952a3031'
            'c5d63dc5a391c28eec09181c684af882898e9c37a29615fe086ce59ac267e1e1b22af19461277b4ca9f81049288307e3d9ba806d6dc395fc4b98d61234f25d63'
            'f4f5ec0ed0c72ab640188d802d81daf2a14c1eab3fedb0e3d6b85068cc5c2164bd1fddb1db6a4d53ae1cbe4a439ab244f96fed3a1e05c6e09893d366904f9d9d'
            'cde29735b23877e3c1dafd07bb1e86ddb84f48e836db5872bbce67ff83d15f06097c9f54313742cfbf34d0302de13447581dd976f0f22178726a2a49f5baf19b')


pkgver() {  
  cd "$srcdir/betterww"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
} 

package() {
	mkdir -p "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/licenses/betterww/"
	install -Dm644 "$srcdir/betterww.desktop" "$pkgdir/usr/share/applications/betterww.desktop"
	install -Dm644 "$srcdir/betterww.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/betterww.png"
	install -Dm755 "$srcdir/betterww-launcher" "$pkgdir/usr/bin/betterww-launcher"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/betterww/LICENSE"
	cp -r "$srcdir/betterww/" "$pkgdir/opt/"
}
