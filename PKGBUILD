# Maintainer: Balazs Mezei <mezei92@gmail.com>
pkgname=zmninja
pkgver=1.3.013
pkgrel=1
pkgdesc="High performance, cross platform ionic app for Home/Commerical Security Surveillance using ZoneMinder or other NVRs"
arch=(x86_64)
url="https://github.com/pliablepixels/zmNinja"
license=('custom:cc-by-nc-sa-4.0' 'custom')
depends=('gconf')
source=("${pkgname}-${pkgver}.zip::https://github.com/pliablepixels/zmNinja/releases/download/v$pkgver/zmNinja-linux64bit.zip" "zmninja.desktop" "cc-by-nc-sa-4.0.txt" "zmninja.png")
sha256sums=(""c7bdee37f620f54dd49b4427c9fdb8876f6068d695cc8065df5ff05c39379ab3 "SKIP" "SKIP" "SKIP")

build() {
	:
}


package() {
	cd $pkgdir
	install -d usr/share/$pkgname
	cp -R $srcdir/zmNinja-linux64bit/* usr/share/$pkgname
	install -d usr/bin
	ln -s  /usr/share/$pkgname/zmNinja usr/bin/$pkgname

	install -D -m644 $srcdir/zmninja.desktop usr/share/applications/$pkgname.desktop
	install -D -m644 usr/share/$pkgname/ZMNINJA-LICENSE-DESKTOP-CLIENT.txt usr/share/licenses/$pkgname/LICENSE
	install -D -m644 $srcdir/cc-by-nc-sa-4.0.txt usr/share/licenses/$pkgname/cc-by-nc-sa-4.0.txt
	install -D -m644 $srcdir/zmninja.png usr/share/pixmaps/$pkgname.png
}
