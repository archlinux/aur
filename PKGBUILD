# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=4.2.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "i686" ] && pkgarch=i386 || pkgarch=$CARCH

source=(http://downloads.linux.hp.com/SDR/downloads/ServicePackforProLiant/RHEL/6.4/$CARCH/current/$pkgname-${pkgver//_/-}.$pkgarch.rpm)

sha256sums=('3cdd67cba1545617db0cd39fb9a7c15b8f72e4aeaac16fc0a3c0624f8f723f6d')
if [ $CARCH = "i686" ]; then
	sha256sums=('fcac62f2bf74fc1fea531a0e6280c15a590cd80c15aa829246d54a54080a3997')
fi

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"
}
