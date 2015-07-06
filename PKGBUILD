# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>
pkgname=heli-x
pkgver=5
pkgrel=1
pkgdesc='HELI-X RC Flight Simulator'
arch=('i686' 'x86_64')
url='http://www.heli-x.info'
license=('unknown')
depends=('java-runtime>=6')
install=heli-x.install
source=('http://www.heli-x.info/1405/HELI-X5.tar.gz' 'heli-x.desktop' 'heli-x.png' 'heli-x.install' 'heli-x')
md5sums=('954c7c4123800c1bc9247294f5b2b791'
         'a7f340949236c7c4afa3851b313efc4b'
         '30af503bd32a62decb15f8ca5e03d90e'
         'c58fca72b0c1b257196ea6d15e5c11c2'
         'a359f2c641c60a732e62da8d39a9be55')
package() {
	cd "$srcdir/HELI-X5"
	mkdir -p "$pkgdir/opt/heli-x"
	cp -r * "$pkgdir/opt/heli-x"
	cd "$pkgdir/opt/heli-x"
	find . -iname '*.dll'|xargs rm
	find . -iname '*.bat'|xargs rm
	find . -type f|xargs chmod 644
	find . -type d|xargs chmod 777
	mkdir -p "$pkgdir/usr/bin/"
	install -m 755 "$srcdir/heli-x" "$pkgdir/usr/bin/heli-x"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/heli-x.desktop" "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps"
	cp "$srcdir/heli-x.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
}
