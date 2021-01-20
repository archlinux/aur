# Maintainer: Cydon <cydoncs@gmail.com>
pkgname=dropship-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Launcher and Mod manager for Among Us'
arch=('x86_64')
url='https://github.com/NuclearPowered/Dropship'
license=('GPL3')
provides=('dropship')
conflicts=('dropship')
source=("https://github.com/NuclearPowered/Dropship/releases/download/v$pkgver/dropship-$pkgver.AppImage")
sha256sums=('c4f7a47d5f0ae0642b2c6afcf5650cf2787fb4c3437977f53683a7ff7038cfc0')

package() {
	cd "$srcdir"

	chmod +x "dropship-$pkgver.AppImage"
	./"dropship-$pkgver.AppImage" --appimage-extract
	mkdir -p "$pkgdir/opt"
	cp -r squashfs-root "$pkgdir/opt/Dropship"
	chmod go+rX -R "$pkgdir/opt/Dropship"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/Dropship/AppRun "$pkgdir/usr/bin/dropship"
}
