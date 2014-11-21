# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpsmh
pkgver=7.4.0_13
pkgrel=1
pkgdesc="HP System Management Homepage"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(expat pam libidn curl)
groups=(hpproliant)
license=("CUSTOM")
options=(!strip)

sha256sums=('dec1164b86ee04d1bda5a5126cf44b0d421e37ad1b9b08a7e0c6d15045aa77bc')
source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/7/$CARCH/current/$pkgname-${pkgver//_/-}.$CARCH.rpm)

if [ "$CARCH" = "i686" ]; then
	_pkgarch=i386
	pkgver=7.3.1_4
	source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/$_pkgarch/current/$pkgname-${pkgver//_/-}.$_pkgarch.rpm)
sha256sums=('8f6bd5b034789fdbdca6523671151f54f894d2a47e0fce0e576066c67cc46d7e')
fi

package() {
	cp -a "$srcdir/"{etc,opt,usr} "$pkgdir"
}
