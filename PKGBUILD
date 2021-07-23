# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=lib32-agena-bin
pkgname=(lib32-agena-bin agena-bin)
pkgver=2.22.1
pkgrel=2
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=('x86_64' 'i686')
url="http://agena.sourceforge.net"
license=('GPL')
source=("$pkgname-$pkgver.deb::https://master.dl.sourceforge.net/project/agena/Binaries/Agena%20$pkgver/agena-$pkgver-linux.i386.deb"
        'agena.desktop')
sha256sums=('bc4ca05db82ddbfaa5bf431ca92b38f68dd1864793741830a7983b1f80c40b58'
            'ba78385e07999f6d491e434ba8beaf1dfcf3e1aa45f74a828aad94300928b02f')

prepare() {
	bsdtar xf data.tar.xz
}

package_lib32-agena-bin() {
	depends=('lib32-libxext' 'lib32-ncurses' 'lib32-readline')
	arch=('x86_64')
	provides=('agena' 'agena-editor')
	conflicts=('agena' 'agena-editor')

	install -Dm 755 usr/local/bin/agena{,edit} -t "$pkgdir/usr/bin/"
	install -Dm 644 usr/local/lib/libagena.{a,so} -t "$pkgdir/usr/lib32/"
	install -Dm 644 agena.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm 644 usr/agena/share/icons/agenasmall.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/agena.png"
	install -Dm 644 usr/agena/share/icons/agena.png -t "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	install -Dm 644 usr/agena/share/icons/agena64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/agena.png"
	install -Dm 644 usr/agena/share/icons/agena128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/agena.png"

	ln -s /usr/lib32/libreadline.so.8 "$pkgdir/usr/lib32/libreadline.so.7"
	ln -s /usr/lib32/libreadline.so.8 "$pkgdir/usr/lib32/libreadline.so.6"
	ln -s /usr/lib32/libhistory.so.8 "$pkgdir/usr/lib32/libhistory.so.7"
	ln -s /usr/lib32/libncursesw.so "$pkgdir/usr/lib32/libncurses.so.5"
	ln -s /usr/lib32/libncursesw.so "$pkgdir/usr/lib32/libtinfo.so.5"
}

package_agena-bin() {
	depends=('libxext' 'ncurses' 'readline')
	arch=('i686' 'x86_64')
	provides=('agena' 'agena-editor')
	conflicts=('agena' 'agena-editor')

	install -Dm 755 usr/local/bin/agena{,edit} -t "$pkgdir/usr/bin/"
	install -Dm 644 usr/local/lib/libagena.{a,so} -t "$pkgdir/usr/lib/"
	install -Dm 644 agena.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm 644 usr/agena/share/icons/agenasmall.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/agena.png"
	install -Dm 644 usr/agena/share/icons/agena.png -t "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	install -Dm 644 usr/agena/share/icons/agena64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/agena.png"
	install -Dm 644 usr/agena/share/icons/agena128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/agena.png"

	ln -s /usr/lib/libreadline.so.8 "$pkgdir/usr/lib/libreadline.so.7"
	ln -s /usr/lib/libreadline.so.8 "$pkgdir/usr/lib/libreadline.so.6"
	ln -s /usr/lib/libhistory.so.8 "$pkgdir/usr/lib/libhistory.so.7"
	ln -s /usr/lib/libncursesw.so "$pkgdir/usr/lib/libncurses.so.5"
	ln -s /usr/lib/libncursesw.so "$pkgdir/usr/lib/libtinfo.so.5"
}
