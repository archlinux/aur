# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Based on PKGBUILD for iscan-plugin-gt-x770.

pkgname=iscan-plugin-gt-s600
pkgver=2.1.2_1
pkgrel=4
pkgdesc="iscan plugin for Epson Perfection V10."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYS')
depends=('iscan')
makedepends=('rpmextract')
install=gt-s600.install
md5sums_x86_64=('9e36fd80b1f8ffa3f658b6a025d5e186')
source_x86_64=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/58/35/e7b4314a66167d0b48ef370bb428dd298482cef2/iscan-plugin-gt-s600-2.1.2-1.x86_64.rpm)
md5sums_i686=('0a3a83dbbb2630c5e9453cc78983ab81')
source_i686=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/58/35/77bf4c0a885f42e920ab9dd0a4ef2404e8863425/iscan-plugin-gt-s600-2.1.2-1.i386.rpm)

package() {
	if [ "$CARCH" = "i686" ]
	then
		_arch=i386
	else
		_arch=$CARCH
	fi

	cd "$srcdir"
	rpmextract.sh "$pkgname-${pkgver//_/-}.$_arch.rpm"
	mv usr "$pkgdir"

	if [ "$CARCH" = "x86_64" ]
	then
		mv "$pkgdir"/usr/lib{64,}
	fi

	install -m 644 -D \
		"$pkgdir"/usr/share/doc/iscan-plugin-gt-s600-2.1.2/AVASYSPL.en.txt \
		"$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
