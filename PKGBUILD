# Maintainer: Cydon <cydoncs@gmail.com>
pkgname=dropship-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Launcher and Mod manager for Among Us'
arch=('x86_64')
url='https://github.com/NuclearPowered/Dropship'
license=('GPL3')
provides=('dropship')
conflicts=('dropship')
source=("https://github.com/NuclearPowered/Dropship/releases/download/v$pkgver/dropship-$pkgver.AppImage")
sha256sums=('976380e70066e51c067f754c5d3f327d7dd6993dbcf0b0c14bfb7b04c8841cb0')

package() {
	cd "$srcdir"

	chmod +x "dropship-$pkgver.AppImage"
	./"dropship-$pkgver.AppImage" --appimage-extract
	mkdir -p "$pkgdir/opt"
	cp -r squashfs-root "$pkgdir/opt/Dropship"
	chmod go+rX -R "$pkgdir/opt/Dropship"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/Dropship/dropship "$pkgdir/usr/bin/dropship"
}
