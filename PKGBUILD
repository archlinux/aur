# Contributor: Anton Leontyev <scileont /at/ gmail.com>
pkgname=ttf-georgewilliams
pkgver=1.0
pkgrel=3
pkgdesc='Free unicode TrueType fonts by George Williams: Caliban, Caslon Roman, Cupola'
arch=('any')
license=('BSD')
url='http://fontforge.github.io/sfds/'
makedepends=('unzip')
depends=('fontconfig' 'xorg-font-utils')
#depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
install=ttf-georgewilliams.install
source=(http://ftp.debian.org/debian/pool/main/g/gw-fonts-ttf/gw-fonts-ttf_1.0.orig.tar.bz2)
md5sums=('e81446f5c03ed00fb280072eb75252e6')

prepare() {
	cd gw-fonts-ttf-$pkgver

	gunzip Caliban.ttf.gz
	unzip CasUni.zip
	unzip CupUniTTF.zip
}

package() {
	cd gw-fonts-ttf-$pkgver

	install -dm755 "$pkgdir"/usr/share/fonts/TTF

	install -m644 Caliban.ttf "$pkgdir"/usr/share/fonts/TTF/Caliban.ttf
	install -m644 CUPOU___.TTF "$pkgdir"/usr/share/fonts/TTF/CupolaRegular.ttf
	install -m644 CUPOULI_.TTF "$pkgdir"/usr/share/fonts/TTF/CupolaItalic.ttf
	install -m644 CaslonRoman.ttf "$pkgdir"/usr/share/fonts/TTF/CaslonRoman.ttf
	install -m644 CaslonItalic.ttf "$pkgdir"/usr/share/fonts/TTF/CaslonItalic.ttf
	install -m644 CaslonBold.ttf "$pkgdir"/usr/share/fonts/TTF/CaslonBold.ttf

	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/ttf-georgewilliams/COPYING
}
