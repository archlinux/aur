# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=4.3.0_0
pkgrel=2
pkgdesc="RILOE II/iLo online configuration utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")

[ "$CARCH" = "i686" ] && pkgarch=i386 || pkgarch=$CARCH

source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/$CARCH/current/$pkgname-${pkgver//_/-}.$pkgarch.rpm)

sha256sums=('f751a3efdd15272a65166d238a94285272dd26072336be6426579b8cc87b5931')
if [ "$CARCH" = "i686" ]; then
	sha256sums=('36bb399e5232a7ca3eef53491584838fe215e712433d5d0ad500de45ac13e054')
fi

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"

	cd "$pkgdir"/usr
	[ -d lib64 ] && mv lib64 lib
}
