# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpsmh
pkgver=7.3.1_4
pkgrel=1
pkgdesc="HP System Management Homepage"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash perl expat zlib pam libidn)
groups=(hpproliant)
license=("CUSTOM")
options=(!strip)

pkgarch=$CARCH
sha256sums=('0db6982d252b159c0bc6cbe105aa8f30c24c86102fb7d49b16261bcb1650d0d6')
if [ "$CARCH" = "i686" ]; then
	pkgarch=i386
	sha256sums=('8f6bd5b034789fdbdca6523671151f54f894d2a47e0fce0e576066c67cc46d7e')
fi

source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/$pkgarch/current/${pkgname}-${pkgver//_/-}.$pkgarch.rpm)

package() {
	cp -a "$srcdir/"{etc,opt,usr,var} "$pkgdir"
}

