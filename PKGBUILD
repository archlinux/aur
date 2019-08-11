# Maintainer: Balazs Mezei <mezei92@gmail.com>
pkgname=zmninja
pkgver=1.3.074
_customver=1.3.74
pkgrel=1
pkgdesc="High performance, cross platform ionic app for Home/Commerical Security Surveillance using ZoneMinder or other NVRs"
arch=(x86_64)
options=(!strip)
url="https://github.com/pliablepixels/zmNinja"
license=('custom:cc-by-nc-sa-4.0' 'custom')
depends=('gconf')
_zmninja_file="zmninjapro-$_customver-linux-$arch.AppImage"
source=("https://github.com/pliablepixels/zmNinja/releases/download/v$pkgver/$_zmninja_file" "zmninja.desktop" "cc-by-nc-sa-4.0.txt" "LICENSE" "zmninja.png")
sha256sums=("4ad8cea2d01fbc4f394eef81389b08662340db8278431f8d08828cbd8d6b6164" "SKIP" "SKIP" "SKIP" "SKIP")

build() {
	:
}


package() {
	cd $pkgdir
	install -d usr/lib/
	install -d usr/bin/
	ln -s  /usr/lib/$pkgname/$_zmninja_file usr/bin/$pkgname

	install -D -m755 $srcdir/$_zmninja_file usr/lib/$pkgname/$_zmninja_file
	install -D -m644 $srcdir/$pkgname.desktop usr/share/applications/$pkgname.desktop
	install -D -m644 $srcdir/LICENSE usr/share/licenses/$pkgname/LICENSE
	install -D -m644 $srcdir/cc-by-nc-sa-4.0.txt usr/share/licenses/$pkgname/cc-by-nc-sa-4.0.txt
	install -D -m644 $srcdir/zmninja.png usr/share/pixmaps/$pkgname.png
}
