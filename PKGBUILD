# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kxpautility
_pkgname=KXPAUtilityLINUX64BIT
__pkgname=KXPAUtilityLINUX
pkgver=19_9_6
pkgrel=1
pkgdesc="Elecraft Factory APP for use with the KXPA Amplifier - Ham Radio."
arch=('x86_64')
url="https://ftp.elecraft.com/KXPA/Manuals%20Downloads/"
license=('custom:ELECRAFT')
depends=('gcc-libs' 'gtk2' 'curl' 'hamradio-menus')
options=('!strip')
source=(https://ftp.elecraft.com/KXPA/Utilities/${_pkgname}_$pkgver.tar.gz
	$pkgname.1
	$pkgname.desktop)

package() {
	cd $srcdir/${__pkgname}_$pkgver

	install -d $pkgdir/usr/share/$pkgname
	cp -a * $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,licenses/$pkgname}
	install -D -m 644 Help/License.rtf $pkgdir/usr/share/licenses/$pkgname
	install -D -m 644 Resources/icon-48.png $pkgdir/usr/share/pixmaps/kxpautility.png
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications

	chmod 644 $pkgdir/usr/share/$pkgname/Help/*
}
md5sums=('8a9a3141adab81b4414ff6939e213f5a'
         'd4ff1efcc05a56a3d561f43fd6919fe1'
         '37e6821f1ceae8b51fae5cd8b4dbceb7')
sha256sums=('fced6763dd4a7fea4021612f5cdfa34882fb9f2ce65b2d7cad06be47656685fe'
            'a099aaa86632a1ccde1487bfe4179b69605dd3b70aa28be9e5ed3ff0e761e5ff'
            'efc093d259ed561756bd0c262dc05ab932a88b2e01c42622dc0d67da4a5dcc8a')
