# Maintainer: robertfoster
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=trosh
pkgver=1.2
pkgrel=2
pkgdesc="Trosh: The Movie: The Game"
arch=('any')
url="http://stabyourself.net/$pkgname/"
license=('custom')
depends=('love')
source=(${pkgname}.sh
	${pkgname}.desktop
https://github.com/M0Rf30/trosh/archive/$pkgver.tar.gz)

prepare() {
	cd $srcdir/$pkgname-$pkgver
	zip -r ${pkgname}.love *
}
package() {
	cd $srcdir/$pkgname-$pkgver

	# Install Data
	install -D -m755 ${pkgname}.love ${pkgdir}/usr/share/${pkgname}/${pkgname}.love
	# Install Launcher
	install -D -m755 ../${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}


	# Install Desktop
	install -D -m644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

	# Install Icon
	install -D -m644 graphics/awesome.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

	# Install License
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

md5sums=('928f9bf3f51f4142dfb56d31fcf32df0'
	'846c81ba83c2eb00fe6638a0a25a730b'
'7d4b82f2eb3db0a437f2397eecfadbac')
