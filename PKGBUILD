# Maintainer: Balazs Mezei <mezei92@gmail.com>
pkgname=zmninja
pkgver=1.3.018
_customver=1.3.18
pkgrel=1
pkgdesc="High performance, cross platform ionic app for Home/Commerical Security Surveillance using ZoneMinder or other NVRs"
arch=(x86_64)
options=(!strip)
url="https://github.com/pliablepixels/zmNinja"
license=('custom:cc-by-nc-sa-4.0' 'custom')
depends=('gconf')
source=("$pkgname.AppImage::https://github.com/pliablepixels/zmNinja/releases/download/v$pkgver/zmninjapro-$_customver-$arch.AppImage" "zmninja.desktop" "cc-by-nc-sa-4.0.txt" "LICENSE" "zmninja.png")
sha256sums=("a77a45b28a8208b7ae5bb33bf8114c3521837e144c088a06de5f14b2b8502b42" "SKIP" "SKIP" "SKIP" "SKIP")

build() {
	:
}


package() {
	cd $pkgdir
	install -d usr/lib/
	install -d usr/bin/
	ln -s  /usr/lib/$pkgname/$pkgname.AppImage usr/bin/$pkgname

	install -D -m755 $srcdir/$pkgname.AppImage usr/lib/$pkgname/$pkgname.AppImage
	install -D -m644 $srcdir/$pkgname.desktop usr/share/applications/$pkgname.desktop
	install -D -m644 $srcdir/LICENSE usr/share/licenses/$pkgname/LICENSE
	install -D -m644 $srcdir/cc-by-nc-sa-4.0.txt usr/share/licenses/$pkgname/cc-by-nc-sa-4.0.txt
	install -D -m644 $srcdir/zmninja.png usr/share/pixmaps/$pkgname.png
	sync
}
