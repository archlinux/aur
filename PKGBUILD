# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpacucli
pkgver=9.40_12.0
pkgrel=1
pkgdesc="HP Command Line Array Configuration Utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "i686" ] && pkgarch=i386 || pkgarch=$CARCH

source=(http://downloads.linux.hp.com/SDR/downloads/ServicePackforProLiant/RHEL/6.4/$CARCH/current/$pkgname-${pkgver//_/-}.$pkgarch.rpm)

package() {
	cd "$srcdir"
	mv usr/{sbin,bin}
	cp -a {opt,usr} "$pkgdir"
}

sha256sums=('df3bea520c884eee58e4964da08864c949750b2df9b8c974b692b34f5a465ee3')
