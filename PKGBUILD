# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpacucli
pkgver=9.40_12.0
pkgrel=1
pkgdesc="HP Command Line Array Configuration Utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash)
groups=(hpproliant)
license=("CUSTOM")

[ "$CARCH" = "i686" ] && pkgarch=i386 || pkgarch=$CARCH

source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/$CARCH/current/$pkgname-${pkgver//_/-}.$pkgarch.rpm)

sha256sums=('df3bea520c884eee58e4964da08864c949750b2df9b8c974b692b34f5a465ee3')
if [ "$CARCH" = "i686" ]; then
	sha256sums=('4066b13ac1428fd78b8b31110b5038241a83bb9b6b1bdd5e8cdf0272934ef83c')
fi

package() {
	cd "$srcdir"
	cp -a opt usr "$pkgdir"
	mv "$pkgdir"/usr/{sbin,bin}
}
