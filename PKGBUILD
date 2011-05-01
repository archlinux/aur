# Contributor: Vain
# Based on PKGBUILD for iscan-plugin-gt-x770.

if [ "$CARCH" = "x86_64" ]
then
	march="x86_64"
	md5sums=('9e36fd80b1f8ffa3f658b6a025d5e186')
	install=gt-s600-64.install
else
	march="i386"
	md5sums=('0a3a83dbbb2630c5e9453cc78983ab81')
	install=gt-s600.install
fi

pkgname=iscan-plugin-gt-s600
pkgver=2.1.2_1
pkgrel=1
pkgdesc="iscan plugin for Epson Perfection V10."
arch=('i686' 'x86_64')
url="http://www.avasys.jp/lx-bin2/linux_e/spc/DL2.do"
license=('GPL' 'LGPL' 'EAPL')
depends=('iscan')
makedepends=('rpmextract')
source=(http://linux.avasys.jp/drivers/iscan-plugins/$pkgname/${pkgver%_*}/$pkgname-${pkgver//_/-}.$march.rpm)

build() {
	cd "$startdir"
	rpmextract.sh "$pkgname-${pkgver//_/-}.$march.rpm"
	mv usr "$pkgdir"
}
