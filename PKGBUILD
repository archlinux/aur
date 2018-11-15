# Maintainer: Bryce <onyxdelta@hotmail.com>
pkgname="trilium-linux-x64-bin"
pkgver=0.23.1
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies."
depends=('python' 'make' 'gconf' 'libxss' 'nss' 'lib32-gcc-libs' 'gtk3')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-$pkgver.7z")
sha256sums=('4c3f2d2d62175bd400ce2914146b6c6b0af195e09454d348916fd27ecac76aaf')
 
package()
{
	export destdir="$pkgdir/"
	mkdir -p "$pkgdir/usr/share/trilium"
	mkdir -p "$pkgdir/usr/lib"
	mv trilium-linux-x64/libffmpeg.so trilium-linux-x64/libnode.so -t "$pkgdir/usr/lib"
	mv trilium-linux-x64/* "$pkgdir/usr/share/trilium"
	mkdir -p "$pkgdir/usr/bin"
	echo -e "#!/bin/sh\n/usr/share/trilium/trilium" > "$pkgdir/usr/bin/trilium"
	chmod +x "$pkgdir/usr/bin/trilium"
}
