# Maintainer: Cydon <cydoncs@gmail.com>
pkgname=dropship-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Launcher and Mod manager for Among Us'
arch=('x86_64')
url='https://github.com/NuclearPowered/Dropship'
license=('GPL3')
provides=('dropship')
conflicts=('dropship')
source=("https://github.com/NuclearPowered/Dropship/releases/download/v$pkgver/dropship-$pkgver.AppImage")
sha256sums=('44e836ce91614b7f89bc5cb2051a19560c1913581c7d860528e40be4ac803796')

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
